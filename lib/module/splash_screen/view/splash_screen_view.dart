import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:magicbook/core.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  Widget build(context, SplashScreenController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 187, 119, 165),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Logo Icon dengan animasi
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_stories,
                  size: 80,
                  color: Colors.purple,
                ),
              )
                  .animate()
                  .scale(
                    duration: 15.ms,
                    curve: Curves.elasticOut,
                  )
                  .shimmer(
                    delay: 15.ms,
                    duration: 15.ms,
                  ),

              const SizedBox(height: 40),

              // App Name dengan animasi
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'MagicBook',
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),

              const SizedBox(height: 20),

              // Subtitle dengan animasi
              const Text(
                'Lembar Kerja Digital Interaktif',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  letterSpacing: 1,
                ),
              ).animate().fadeIn(delay: 800.ms, duration: 600.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    delay: 800.ms,
                    duration: 600.ms,
                  ),

              const Spacer(),

              // Features Cards dengan animasi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    _buildFeatureCard(
                      icon: Icons.book_outlined,
                      title: 'Pembelajaran Interaktif',
                      description: 'Belajar dengan cara yang menyenangkan',
                      delay: 120,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureCard(
                      icon: Icons.emoji_events_outlined,
                      title: 'Sistem Gamifikasi',
                      description: 'Raih achievement dan tingkatkan level',
                      delay: 140,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureCard(
                      icon: Icons.trending_up,
                      title: 'Track Progress',
                      description: 'Pantau perkembangan belajarmu',
                      delay: 160,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Loading Indicator
              Column(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 6,
                    ),
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .rotate(duration: 2000.ms),
                  const SizedBox(height: 16),
                  const Text(
                    'Memuat aplikasi...',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .fadeIn(duration: 500.ms)
                      .then()
                      .fadeOut(duration: 500.ms),
                ],
              ),

              const SizedBox(height: 40),

              // Footer
              const Text(
                'Untuk Siswa SMK',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required int delay,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms, duration: 100.ms).slideX(
          begin: -0.2,
          end: 0,
          delay: delay.ms,
          duration: 100.ms,
          curve: Curves.easeOut,
        );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}
