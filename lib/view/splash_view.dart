import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Wait for the widget to be fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    try {
      // Wait for 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      // Check if widget is still mounted before navigating
      if (!mounted) return;

      // Navigate to login screen
      Navigator.pushReplacementNamed(context, RoutesName.login);
    } catch (e) {
      print('Splash screen navigation error: $e');
      // Optional: Add a fallback navigation or retry mechanism
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: SafeArea(
        child: Center(child: SvgPicture.asset("assets/icons/app_logo.svg")),
      ),
    );
  }
}
