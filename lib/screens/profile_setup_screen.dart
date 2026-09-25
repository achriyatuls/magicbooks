import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/service/auth_service.dart';
import '../shared/model/user_model.dart';
import '../shared/widget/reusable_widgets.dart';
import 'main_navigation_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _kelasController = TextEditingController();
  final _absenController = TextEditingController();

  bool _isLoading = false;
  UserModel? _userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _jurusanController.dispose();
    _kelasController.dispose();
    _absenController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await _authService.getUserData(user.uid);
      if (userData != null) {
        setState(() {
          _userData = userData;
        });
        _namaController.text = userData.nama;
        _jurusanController.text = userData.jurusan;
        _kelasController.text = userData.kelas;
        _absenController.text = userData.absen;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Profil'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAD88C6),
              Color(0xFFE1AFD1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  const Text(
                    'Lengkapi Profil Anda',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Informasi ini akan digunakan untuk melacak progress pembelajaran Anda',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Profile Picture Section
                  ReusableCard(
                    backgroundColor: Colors.white,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xFFAD88C6),
                          backgroundImage: _userData?.photoURL != null
                              ? NetworkImage(_userData!.photoURL!)
                                  as ImageProvider
                              : null,
                          child: _userData?.photoURL == null
                              ? Text(
                                  (_userData?.nama.isNotEmpty ?? false)
                                      ? _userData!.nama
                                          .substring(0, 1)
                                          .toUpperCase()
                                      : 'U',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _userData?.nama ?? 'User',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _userData?.email ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Form Fields
                  ReusableCard(
                    backgroundColor: Colors.white,
                    child: Column(
                      children: [
                        ReusableTextField(
                          label: 'Nama Lengkap',
                          controller: _namaController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 16),
                        ReusableTextField(
                          label: 'Jurusan',
                          controller: _jurusanController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jurusan tidak boleh kosong';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.school),
                        ),
                        const SizedBox(height: 16),
                        ReusableTextField(
                          label: 'Kelas',
                          controller: _kelasController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kelas tidak boleh kosong';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.class_),
                        ),
                        const SizedBox(height: 16),
                        ReusableTextField(
                          label: 'Nomor Absen',
                          controller: _absenController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nomor absen tidak boleh kosong';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.badge),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Save Button
                  ReusableButton(
                    text: 'Lengkapi Profil',
                    isLoading: _isLoading,
                    onPressed: _saveProfile,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),

                  const SizedBox(height: 16),

                  // Info text
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.shade300),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.orange.shade700,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Anda harus melengkapi semua data untuk melanjutkan',
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await _authService.getUserData(user.uid);
        if (userData != null) {
          final updatedUser = userData.copyWith(
            nama: _namaController.text.trim(),
            jurusan: _jurusanController.text.trim(),
            kelas: _kelasController.text.trim(),
            absen: _absenController.text.trim(),
          );

          final success = await _authService.updateUserData(updatedUser);

          if (success && mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainNavigationScreen(),
              ),
            );
          } else if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Gagal menyimpan profil'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
