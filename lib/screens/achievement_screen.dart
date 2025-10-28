import 'package:flutter/material.dart';
import '../shared/model/achievement_model.dart';
import '../shared/widget/reusable_widgets.dart';

class AchievementScreen extends StatefulWidget {
  final Map<String, dynamic> userProgress;

  const AchievementScreen({
    Key? key,
    required this.userProgress,
  }) : super(key: key);

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  late List<Achievement> unlockedAchievements;
  late List<Achievement> lockedAchievements;

  @override
  void initState() {
    super.initState();
    _loadAchievements();
  }

  void _loadAchievements() {
    unlockedAchievements =
        AchievementService.getUnlockedAchievements(widget.userProgress);
    lockedAchievements =
        AchievementService.getLockedAchievements(widget.userProgress);

    // Log untuk debugging
    print('🏆 Achievement System:');
    print('Unlocked: ${unlockedAchievements.length}');
    print('Locked: ${lockedAchievements.length}');
    print('User Progress: ${widget.userProgress}');
  }

  void _showAchievementDetails(Achievement achievement) {
    final isUnlocked = achievement.isUnlocked(widget.userProgress);
    final progressPercentage =
        achievement.getProgressPercentage(widget.userProgress);
    final progressText = achievement.getProgressText(widget.userProgress);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(
              achievement.icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                achievement.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? Colors.green : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                achievement.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              // Rarity Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(int.parse(
                          AchievementService.getRarityColor(achievement.rarity)
                              .substring(1),
                          radix: 16) +
                      0xFF000000),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  achievement.rarity,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // XP Reward
              Row(
                children: [
                  const Icon(Icons.stars, color: Colors.amber, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    '${achievement.xpReward} XP Reward',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Requirements
              Text(
                'Requirements:',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              ...achievement.requirements.map((req) => Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          isUnlocked
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: isUnlocked ? Colors.green : Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            req,
                            style: TextStyle(
                              color:
                                  isUnlocked ? Colors.green : Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 16),

              // Progress
              if (!isUnlocked) ...[
                Text(
                  'Progress:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progressPercentage / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(int.parse(
                            AchievementService.getRarityColor(
                                    achievement.rarity)
                                .substring(1),
                            radix: 16) +
                        0xFF000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  progressText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
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
          child: Column(
            children: [
              // Stats Header
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${unlockedAchievements.length}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                        ),
                        const Text('Unlocked'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${lockedAchievements.length}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                        ),
                        const Text('Locked'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${AchievementService.getTotalXPFromAchievements(widget.userProgress)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                        ),
                        const Text('XP Earned'),
                      ],
                    ),
                  ],
                ),
              ),

              // Achievements List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    // Unlocked Achievements
                    if (unlockedAchievements.isNotEmpty) ...[
                      Text(
                        'Unlocked Achievements',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 8),
                      ...unlockedAchievements.map((achievement) =>
                          _buildAchievementCard(achievement, true)),
                      const SizedBox(height: 24),
                    ],

                    // Locked Achievements
                    if (lockedAchievements.isNotEmpty) ...[
                      Text(
                        'Locked Achievements',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 8),
                      ...lockedAchievements.map((achievement) =>
                          _buildAchievementCard(achievement, false)),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementCard(Achievement achievement, bool isUnlocked) {
    final rarityColor = Color(int.parse(
            AchievementService.getRarityColor(achievement.rarity).substring(1),
            radix: 16) +
        0xFF000000);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ReusableCard(
        backgroundColor: isUnlocked ? Colors.white : Colors.grey[100],
        onTap: () => _showAchievementDetails(achievement),
        child: Row(
          children: [
            // Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isUnlocked
                    ? rarityColor.withOpacity(0.1)
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isUnlocked ? rarityColor : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  achievement.icon,
                  style: TextStyle(
                    fontSize: 24,
                    color: isUnlocked ? rarityColor : Colors.grey[600],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          achievement.title,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isUnlocked
                                        ? Colors.black
                                        : Colors.grey[600],
                                  ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: isUnlocked ? rarityColor : Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          achievement.rarity,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    achievement.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isUnlocked ? Colors.black87 : Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.stars,
                        color: isUnlocked ? Colors.amber : Colors.grey[400],
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${achievement.xpReward} XP',
                        style: TextStyle(
                          color: isUnlocked ? Colors.amber : Colors.grey[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isUnlocked ? Icons.check_circle : Icons.lock,
                        color: isUnlocked ? Colors.green : Colors.grey[400],
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
