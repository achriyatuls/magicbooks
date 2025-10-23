import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/service/auth_service.dart';
import '../shared/model/user_model.dart';
import '../shared/widget/reusable_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
    setState(() {
      _isLoading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await _authService.getUserData(user.uid);
        if (userData != null) {
          setState(() {
            _userData = userData;
            _namaController.text = userData.nama;
            _jurusanController.text = userData.jurusan;
            _kelasController.text = userData.kelas;
            _absenController.text = userData.absen;
          });
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: Container(
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
          child: _isLoading
              ? const ReusableLoadingWidget(message: 'Memuat data profil...')
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Profile Picture Section
                        ReusableCard(
                          backgroundColor: Colors.white,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: const Color(0xFFAD88C6),
                                child: Text(
                                  _userData?.nama
                                          .substring(0, 1)
                                          .toUpperCase() ??
                                      'U',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Foto Profil',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Foto profil menggunakan avatar berdasarkan nama',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Form Fields
                        ReusableCard(
                          backgroundColor: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Informasi Profil',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 16),
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

                        const SizedBox(height: 24),

                        // Account Information
                        ReusableCard(
                          backgroundColor: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Informasi Akun',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              _buildInfoRow('Email', _userData?.email ?? '-'),
                              _buildInfoRow('Bergabung',
                                  _formatDate(_userData?.createdAt)),
                              _buildInfoRow('Terakhir Update',
                                  _formatDate(_userData?.updatedAt)),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ReusableButton(
                                text: 'Batal',
                                backgroundColor: Colors.grey,
                                onPressed: () => Navigator.of(context).pop(),
                                icon: Icons.close,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ReusableButton(
                                text: 'Simpan \nPerubahan',
                                isLoading: _isLoading,
                                onPressed: _saveProfile,
                                icon: Icons.save,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return '${date.day}/${date.month}/${date.year}';
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
      if (user != null && _userData != null) {
        final updatedUser = _userData!.copyWith(
          nama: _namaController.text.trim(),
          jurusan: _jurusanController.text.trim(),
          kelas: _kelasController.text.trim(),
          absen: _absenController.text.trim(),
        );

        final success = await _authService.updateUserData(updatedUser);

        if (success && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profil berhasil diperbarui'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pop();
        } else if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal menyimpan perubahan'),
              backgroundColor: Colors.red,
            ),
          );
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
