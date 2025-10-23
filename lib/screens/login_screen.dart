import 'package:flutter/material.dart';
import '../shared/service/auth_service.dart';
import '../shared/widget/reusable_widgets.dart';
import 'profile_setup_screen.dart';
import 'main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color(0xFFE1AFD1),
              // Color(0xFFAD88C6),

              Color(0xFFE1AFD1), // Ungu gelap
              Color(0xFF9D4EDD), // Ungu terang
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo/Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.book,
                    size: 60,
                    color: Color(0xFFAD88C6),
                  ),
                ),

                const SizedBox(height: 40),

                // App Title
                const Text(
                  'Magic Book',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                const Text(
                  'Platform Pembelajaran Flutter Interaktif',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 60),

                // Google Sign In Button
                ReusableButton(
                  text: 'Masuk dengan Google',
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFFAD88C6),
                  icon: Icons.login,
                  isLoading: _isLoading,
                  onPressed: _signInWithGoogle,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),

                const SizedBox(height: 24),

                // Terms and Privacy
                const Text(
                  'Dengan masuk, Anda menyetujui\nKetentuan Layanan dan Kebijakan Privasi',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userCredential = await _authService.signInWithGoogle();

      if (userCredential != null && mounted) {
        // Check if user profile is complete (nama, jurusan, kelas, absen)
        final isProfileComplete = await _authService.isUserProfileComplete(
          userCredential.user!.uid,
        );

        if (isProfileComplete) {
          // Profile complete - go to dashboard
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainNavigationScreen(),
            ),
          );
        } else {
          // Profile incomplete - must complete profile first
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ProfileSetupScreen(),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal masuk: $e'),
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
