import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:magicbook/state_util.dart';
import '../view/eprofile1_view.dart';
import '../../../../shared/service/auth_service.dart';
import '../../../../shared/model/user_model.dart';

class Eprofile1Controller extends State<Eprofile1View>
    implements MvcController {
  static late Eprofile1Controller instance;
  late Eprofile1View view;

  // User Data untuk foto dari Google account
  UserModel? _userData;
  final AuthService _authService = AuthService();
  bool _isLoading = true;

  // Getter untuk mengakses user data dan loading state dari view
  UserModel? get userData => _userData;
  bool get isLoading => _isLoading;

  @override
  void initState() {
    instance = this;
    _loadUserData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // Method untuk load user data dari Google account
  Future<void> _loadUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await _authService.getUserData(user.uid);
        if (userData != null) {
          setState(() {
            _userData = userData;
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }
}
