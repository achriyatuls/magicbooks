import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:magicbook/state_util.dart';
import '../service/dashboard_service.dart';
import '../view/dashboard_view.dart';
import '../../../shared/service/auth_service.dart';
import '../../../shared/model/user_model.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;
  DashboardService dashboardService = DashboardService();

  // Gamification Properties
  int userLevel = 1;
  int totalPoints = 0;
  int currentLevelProgress = 0;
  int nextLevelRequirement = 100;
  int completedModules = 0;
  int currentStreak = 0;

  // Profile Photo
  File? profilePhoto;
  final ImagePicker _picker = ImagePicker();

  // User Data untuk foto dari Google account
  UserModel? _userData;
  final AuthService _authService = AuthService();

  // Getter untuk mengakses user data dari view
  UserModel? get userData => _userData;

  List<Map<String, dynamic>> achievements = [
    {
      'title': 'First Steps',
      'description': 'Complete your first module',
      'icon': Icons.star,
      'unlocked': false,
    },
    {
      'title': 'Quick Learner',
      'description': 'Complete 3 modules in a row',
      'icon': Icons.speed,
      'unlocked': false,
    },
    {
      'title': 'Dedicated',
      'description': 'Maintain a 7-day streak',
      'icon': Icons.local_fire_department,
      'unlocked': false,
    },
    {
      'title': 'Expert',
      'description': 'Complete 10 modules',
      'icon': Icons.emoji_events,
      'unlocked': false,
    },
    {
      'title': 'Master',
      'description': 'Complete all modules',
      'icon': Icons.military_tech,
      'unlocked': false,
    },
  ];

  @override
  void initState() {
    instance = this;
    _loadUserProgress();
    _loadUserData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String mode = "Basic";

  void updateMode() {
    if (mode == "Basic") {
      mode = "UI";
    } else {
      mode = "Basic";
    }
    setState(() {});
  }

  void toggleMode() {
    updateMode();
  }

  void _loadUserProgress() {
    // Simulasi data user progress
    // Dalam aplikasi nyata, ini akan diambil dari SharedPreferences atau database
    completedModules = 2; // User sudah menyelesaikan 2 module
    currentStreak = 3; // Streak 3 hari
    totalPoints = 250; // Total 250 XP
    currentLevelProgress = 50; // Progress ke level berikutnya
    nextLevelRequirement = 100; // Butuh 100 XP untuk naik level

    // Update achievements berdasarkan progress
    _updateAchievements();
  }

  // Method untuk load user data dari Google account
  Future<void> _loadUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await _authService.getUserData(user.uid);
        if (userData != null) {
          setState(() {
            _userData = userData;
          });
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  void _updateAchievements() {
    // First Steps - Complete first module
    if (completedModules >= 1) {
      achievements[0]['unlocked'] = true;
    }

    // Quick Learner - Complete 3 modules
    if (completedModules >= 3) {
      achievements[1]['unlocked'] = true;
    }

    // Dedicated - 7 day streak
    if (currentStreak >= 7) {
      achievements[2]['unlocked'] = true;
    }

    // Expert - Complete 10 modules
    if (completedModules >= 10) {
      achievements[3]['unlocked'] = true;
    }

    // Master - Complete all modules
    if (completedModules >= dashboardService.menuItems.length) {
      achievements[4]['unlocked'] = true;
    }
  }

  void completeModule() {
    completedModules++;
    totalPoints += 50; // 50 XP per module
    currentLevelProgress += 50;

    // Check level up
    if (currentLevelProgress >= nextLevelRequirement) {
      _levelUp();
    }

    // Update achievements
    _updateAchievements();

    setState(() {});
  }

  void _levelUp() {
    userLevel++;
    currentLevelProgress = currentLevelProgress - nextLevelRequirement;
    nextLevelRequirement =
        (userLevel * 100).toInt(); // Increase requirement per level

    // Show level up notification
    _showLevelUpNotification();
  }

  void _showLevelUpNotification() {
    // Show level up dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 32),
            const SizedBox(width: 8),
            Text("Level Up!"),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Selamat! Kamu naik ke Level $userLevel!"),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text("Reward: +100 XP Bonus!"),
                  const SizedBox(height: 8),
                  Text(
                      "Progress ke Level ${userLevel + 1}: $currentLevelProgress/$nextLevelRequirement XP"),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Awesome!"),
          ),
        ],
      ),
    );
  }

  void addStreak() {
    currentStreak++;
    totalPoints += 10; // 10 XP per day streak
    currentLevelProgress += 10;

    // Check level up
    if (currentLevelProgress >= nextLevelRequirement) {
      _levelUp();
    }

    // Update achievements
    _updateAchievements();

    setState(() {});
  }

  void resetStreak() {
    currentStreak = 0;
    setState(() {});
  }

  void addPoints(int points) {
    totalPoints += points;
    currentLevelProgress += points;

    // Check level up
    if (currentLevelProgress >= nextLevelRequirement) {
      _levelUp();
    }

    setState(() {});
  }

  // Method untuk mendapatkan progress percentage
  double get progressPercentage {
    return currentLevelProgress / nextLevelRequirement;
  }

  // Method untuk mendapatkan unlocked achievements count
  int get unlockedAchievementsCount {
    return achievements
        .where((achievement) => achievement['unlocked'] == true)
        .length;
  }

  // Method untuk mengambil foto profil dari galeri
  Future<void> pickProfilePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 80,
      );

      if (image != null) {
        profilePhoto = File(image.path);
        setState(() {});

        // Tampilkan pesan sukses
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Foto profil berhasil diubah!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error mengambil foto: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // Method untuk menampilkan dialog pilihan foto
  void showPhotoPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pilih Foto Profil'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pilih dari Galeri'),
              onTap: () {
                Navigator.pop(context);
                pickProfilePhoto();
              },
            ),
            if (profilePhoto != null)
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Hapus Foto Profil'),
                onTap: () {
                  Navigator.pop(context);
                  profilePhoto = null;
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Foto profil dihapus!'),
                      backgroundColor: Colors.orange,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
        ],
      ),
    );
  }
}
