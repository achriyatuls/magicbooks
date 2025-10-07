import 'package:flutter/material.dart';
import 'package:magicbook/state_util.dart';
import '../view/splash_screen_view.dart';

class SplashScreenController extends State<SplashScreenView>
    implements MvcController {
  static late SplashScreenController instance;
  late SplashScreenView view;

  @override
  void initState() {
    instance = this;
    super.initState();

    // Navigate to dashboard after 40 seconds
    Future.delayed(const Duration(seconds: 40), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
