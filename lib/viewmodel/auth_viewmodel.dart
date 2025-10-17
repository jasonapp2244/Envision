import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider_tamplete/repository/auth_repository.dart';
import 'package:provider_tamplete/utils/routes/utils.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(
    String email,
    String password,
    BuildContext context,
  ) async {
    setLoading(true);
    try {
      final user = await _authRepo.login(email, password);
      if (user != null) {
        Utils.tosatMassage("Welcome back, ${user.email}");
        Navigator.pushReplacementNamed(context, RoutesName.mainScreenHolder);
      }
    } catch (e) {
      Utils.flushBarErrorMassage(e.toString(), context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> signupApi(
    String email,
    String password,
    BuildContext context,
  ) async {
    setLoading(true);
    try {
      final user = await _authRepo.signup(email, password);
      if (user != null) {
        Utils.tosatMassage("Account created for ${user.email}");
        Navigator.pushReplacementNamed(context, RoutesName.mainScreenHolder);
      }
    } catch (e) {
      Utils.flushBarErrorMassage(e.toString(), context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> resetPasswordApi(String email, BuildContext context) async {
    try {
      await _authRepo.resetPassword(email);
      Utils.tosatMassage("Reset link sent to $email");
      Navigator.pop(context);
    } catch (e) {
      Utils.flushBarErrorMassage(e.toString(), context);
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authRepo.logout(); // this signs out from Firebase + Google
      Utils.tosatMassage("Logged out successfully");
      Navigator.pushReplacementNamed(context, RoutesName.login);
    } catch (e) {
      Utils.flushBarErrorMassage(e.toString(), context);
    }
  }

  // 🔹 Check user login status on startup
  void checkUserLoggedIn(BuildContext context) {
    final user = _auth.currentUser;
    if (user != null) {
      // user already logged in
      Navigator.pushReplacementNamed(context, RoutesName.mainScreenHolder);
    } else {
      Navigator.pushReplacementNamed(context, RoutesName.login);
    }
  }
}
