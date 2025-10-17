import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/res/components/auth_button.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';
import 'package:provider_tamplete/utils/routes/utils.dart';
import 'package:provider_tamplete/viewmodel/auth_viewmodel.dart';
import 'package:responsive_adaptive_ui/responsive_adaptive_ui.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmFocus = FocusNode();

  @override
  void dispose() {
    _obsecurePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(5),
            vertical: Responsive.h(2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Responsive.h(2)),
              SvgPicture.asset(
                "assets/icons/app_logo.svg",
                width: Responsive.w(25),
              ),
              SizedBox(height: Responsive.h(2)),
              Text(
                "Create Account",
                style: GoogleFonts.rethinkSans(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.sp(25),
                ),
              ),
              SizedBox(height: Responsive.h(1)),
              Text(
                "Sign up to get started",
                style: GoogleFonts.rethinkSans(
                  color: AppColor.textColor,
                  fontSize: Responsive.sp(11),
                ),
              ),
              SizedBox(height: Responsive.h(3)),

              // Email Field
              TextFormField(
                style: TextStyle(color: AppColor.textColor),
                controller: emailController,
                focusNode: emailFocus,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.feildColor,
                  hintText: "Email Address",
                  hintStyle: GoogleFonts.dmSans(
                    color: AppColor.textColor,
                    fontSize: Responsive.sp(13),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(Responsive.w(3)),
                    child: SvgPicture.asset("assets/icons/mail-02.svg"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Responsive.w(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFoucsChange(context, emailFocus, passwordFocus);
                },
              ),
              SizedBox(height: Responsive.h(2)),

              // Password Field
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    style: TextStyle(color: AppColor.textColor),
                    controller: passwordController,
                    focusNode: passwordFocus,
                    obscureText: value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.feildColor,
                      hintText: "Password",
                      hintStyle: GoogleFonts.dmSans(
                        color: AppColor.textColor,
                        fontSize: Responsive.sp(13),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(Responsive.w(3)),
                        child: SvgPicture.asset(
                            "assets/icons/square-lock-password.svg"),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(
                          value ? Icons.visibility_off : Icons.visibility,
                          color: AppColor.textColor,
                          size: Responsive.sp(20),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Responsive.w(12)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.fieldFoucsChange(context, passwordFocus, confirmFocus);
                    },
                  );
                },
              ),
              SizedBox(height: Responsive.h(2)),

              // Confirm Password
              TextFormField(
                style: TextStyle(color: AppColor.textColor),
                controller: confirmPasswordController,
                focusNode: confirmFocus,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.feildColor,
                  hintText: "Confirm Password",
                  hintStyle: GoogleFonts.dmSans(
                    color: AppColor.textColor,
                    fontSize: Responsive.sp(13),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(Responsive.w(3)),
                    child: SvgPicture.asset(
                        "assets/icons/square-lock-password.svg"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Responsive.w(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: Responsive.h(3)),

              // Signup Button
              AuthButton(
                buttontext: "Sign Up",
                loading: authViewModel.loading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMassage("Please enter an email", context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMassage("Please enter a password", context);
                  } else if (passwordController.text.length < 8) {
                    Utils.flushBarErrorMassage(
                        "Password must be at least 8 characters", context);
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    Utils.flushBarErrorMassage("Passwords do not match", context);
                  } else {
                    authViewModel.signupApi(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      context,
                    );
                  }
                },
              ),

              SizedBox(height: Responsive.h(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: Responsive.sp(12),
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive.sp(12),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesName.login,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Responsive.h(2)),
            ],
          ),
        ),
      ),
    );
  }
}
