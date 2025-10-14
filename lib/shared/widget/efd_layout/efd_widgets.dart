import 'package:flutter/material.dart';
import '../../model/efd_config.dart';

/// Reusable UI widgets untuk semua EFD modules
/// Menggantikan duplicated methods di setiap module view
class EfdWidgets {
  /// Info Banner - Header dengan gradient background
  static Widget buildInfoBanner(EfdModuleConfig config) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            config.primaryColor.withValues(alpha: 0.8),
            config.primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            config.customIcon ?? Icons.lightbulb_outline,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  config.defaultBannerTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  config.defaultBannerSubtitle,
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
    );
  }

  /// Quick Stats Card - Menampilkan statistik singkat
  static Widget buildQuickStatsCard(EfdModuleConfig config) {
    final stats = config.getOverallStats();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.speed, color: config.primaryColor),
                const SizedBox(width: 8),
                const Text(
                  'Quick Stats',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  Icons.assignment_outlined,
                  'Total',
                  '${stats.totalExercises}',
                  Colors.blue,
                ),
                _buildStatItem(
                  Icons.check_circle_outline,
                  'Completed',
                  '${stats.completedExercises}',
                  Colors.green,
                ),
                _buildStatItem(
                  Icons.grade_outlined,
                  'Grade',
                  stats.grade.split(' ')[0], // Remove "(Perfect!)" part
                  Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Stat Item - Individual statistic display
  static Widget _buildStatItem(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  /// Instructions Card - Expandable "How to Use" guide
  static Widget buildInstructionsCard(EfdModuleConfig config) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(Icons.help_outline, color: config.primaryColor),
        title: const Text(
          'How to Use',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _numberedItem(
                  1,
                  'Edit code di file ${config.defaultExerciseFileHint}',
                  config.primaryColor,
                ),
                _numberedItem(
                  2,
                  'Tap tombol "Test" untuk validasi jawaban',
                  config.primaryColor,
                ),
                _numberedItem(
                  3,
                  'Lihat detail hasil dengan tap icon ℹ️',
                  config.primaryColor,
                ),
                _numberedItem(
                  4,
                  'Centang hijau = semua test cases passed ✅',
                  config.primaryColor,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: config.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.tips_and_updates,
                        color: config.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Tip: Gunakan "Run All Tests" untuk cek semua exercise sekaligus!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Numbered Item - For instruction steps
  static Widget _numberedItem(int number, String text, Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  /// Section Title - For "Exercises" section
  static Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Exercise Card - Wrapper untuk setiap exercise row
  static Widget buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: child,
      ),
    );
  }

  /// Stat Card - For statistics dialog
  static Widget buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
