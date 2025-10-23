import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(" MagicBook - Learning Hub"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          // Profile Avatar dengan Level dan Foto Profil
          GestureDetector(
            onTap: () => controller.showPhotoPickerDialog(),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.purple.shade300,
                      backgroundImage: controller.userData?.photoURL != null
                          ? NetworkImage(controller.userData!.photoURL!)
                              as ImageProvider
                          : null,
                      child: controller.userData?.photoURL == null
                          ? Text(
                              controller.userData?.nama
                                      .substring(0, 1)
                                      .toUpperCase() ??
                                  'U',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Icon untuk menunjukkan bahwa bisa diklik
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Card dengan Progress
                _buildWelcomeCard(controller),

                const SizedBox(height: 20),

                // Stats Cards
                _buildStatsCards(controller),

                const SizedBox(height: 20),

                // Achievement Section
                _buildAchievementSection(context, controller),

                const SizedBox(height: 20),

                // Learning Modules dengan Progress
                _buildLearningModules(controller),

                const SizedBox(height: 20),

                // UI Examples Section
                _buildUIExamplesSection(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(DashboardController controller) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.purple.shade600],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.school, color: Colors.white, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat Datang di MagicBook!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Level ${controller.userLevel} • ${controller.totalPoints} XP",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Progress Bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Progress ke Level ${controller.userLevel + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${controller.currentLevelProgress}/${controller.nextLevelRequirement} XP",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: controller.currentLevelProgress /
                      controller.nextLevelRequirement,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                  minHeight: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCards(DashboardController controller) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            "Modules Completed",
            "${controller.completedModules}",
            Icons.check_circle,
            Colors.green,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            "Current Streak",
            "${controller.currentStreak} days",
            Icons.local_fire_department,
            Colors.orange,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            "Achievements",
            "${controller.achievements.length}",
            Icons.emoji_events,
            Colors.amber,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
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
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementSection(
      BuildContext context, DashboardController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.emoji_events, color: Colors.amber, size: 24),
            const SizedBox(width: 8),
            const Text(
              "Achievements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => _showAllAchievements(context, controller),
              child: const Text("View All"),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.achievements.length,
            itemBuilder: (context, index) {
              final achievement = controller.achievements[index];
              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: achievement['unlocked']
                            ? Colors.amber
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        achievement['icon'],
                        color: achievement['unlocked']
                            ? Colors.white
                            : Colors.grey,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      achievement['title'],
                      style: TextStyle(
                        fontSize: 10,
                        color: achievement['unlocked']
                            ? Colors.black
                            : Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLearningModules(DashboardController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.book, color: Colors.blue, size: 24),
            const SizedBox(width: 8),
            const Text(
              "Learning Modules",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${controller.completedModules}/${controller.dashboardService.menuItems.length}",
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...controller.dashboardService.menuItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isCompleted = index < controller.completedModules;
          final isCurrent = index == controller.completedModules;

          return _buildModuleCard(item, isCompleted, isCurrent, controller);
        }).toList(),
      ],
    );
  }

  Widget _buildModuleCard(Map item, bool isCompleted, bool isCurrent,
      DashboardController controller) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isCurrent ? 8 : 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isCurrent
            ? BorderSide(color: Colors.blue, width: 2)
            : BorderSide.none,
      ),
      child: ListTile(
        onTap: () => Get.to(item["page"]),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green
                : isCurrent
                    ? Colors.blue
                    : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            isCompleted
                ? Icons.check
                : isCurrent
                    ? Icons.play_arrow
                    : Icons.lock,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          item["label"],
          style: TextStyle(
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            color: isCompleted || isCurrent ? Colors.black : Colors.grey,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item["page"].toString(),
              style: TextStyle(
                color: isCompleted || isCurrent
                    ? Colors.grey.shade600
                    : Colors.grey,
              ),
            ),
            if (isCurrent)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Current Module",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCompleted)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget _buildUIExamplesSection(DashboardController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.design_services, color: Colors.purple, size: 24),
            const SizedBox(width: 8),
            const Text(
              "UI Examples",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => controller.toggleMode(),
              child: Text(
                controller.mode == "Basic" ? "Switch to UI" : "Switch to Basic",
                style: const TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (controller.mode == "UI")
          ...controller.dashboardService.uiItems.take(10).map((item) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                onTap: () => Get.to(item["page"]),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.design_services,
                    color: Colors.purple,
                    size: 20,
                  ),
                ),
                title: Text(item["label"]),
                subtitle: Text(item["page"].toString()),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          }).toList(),
      ],
    );
  }

  void _showAllAchievements(
      BuildContext context, DashboardController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🏆 All Achievements"),
        content: SizedBox(
          width: 300,
          height: 400,
          child: ListView.builder(
            itemCount: controller.achievements.length,
            itemBuilder: (context, index) {
              final achievement = controller.achievements[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: achievement['unlocked']
                        ? Colors.amber
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    achievement['icon'],
                    color: achievement['unlocked'] ? Colors.white : Colors.grey,
                    size: 20,
                  ),
                ),
                title: Text(
                  achievement['title'],
                  style: TextStyle(
                    color: achievement['unlocked'] ? Colors.black : Colors.grey,
                  ),
                ),
                subtitle: Text(achievement['description']),
                trailing: achievement['unlocked']
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.lock, color: Colors.grey),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
