import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';
import 'package:provider_tamplete/viewmodel/auth_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Wait for UI to render before running Firebase check
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // splash delay

      // 🔹 Get your AuthViewModel instance
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      // 🔹 Check Firebase user and redirect accordingly
      authViewModel.checkUserLoggedIn(context);
    } catch (e) {
      debugPrint('Splash initialization error: $e');
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
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/app_logo.svg",
            width: 150,
          ),
        ),
      ),
    );
  }
}
