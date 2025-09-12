import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/res/components/auth_button.dart';
import 'package:provider_tamplete/utils/routes/utils.dart';
import 'package:provider_tamplete/view/home_view.dart';
import 'package:provider_tamplete/view/sginupview.dart';
import 'package:provider_tamplete/widget/socail_icon.dart';
import 'package:responsive_adaptive_ui/responsive_adaptive_ui.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFoucsNode = FocusNode();
  FocusNode passwordFoucsNode = FocusNode();
  FocusNode sumbitFoucsNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordFoucsNode.dispose();
    emailFoucsNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize responsive class
    Responsive.init(context);
    // final authViewmodel = Provider.of<AuthViewmodel>(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(5), // 5% of screen width
            vertical: Responsive.h(2), // 2% of screen height
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Responsive.h(2)), // 2% of screen height
                SvgPicture.asset(
                  "assets/icons/app_logo.svg",
                  width: Responsive.w(25), // 50% of screen width
                ),
                SizedBox(height: Responsive.h(2)),
                Text(
                  "Welcome Back!",
                  style: GoogleFonts.rethinkSans(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.sp(25), // Responsive font size
                  ),
                ),
                SizedBox(height: Responsive.h(1)),
                Text(
                  "Log in to explore about our app",
                  style: GoogleFonts.rethinkSans(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(10.5),
                  ),
                ),
                SizedBox(height: Responsive.h(3)),
                TextFormField(
                  style: TextStyle(color: AppColor.textColor),
                  controller: emailController,
                  focusNode: emailFoucsNode,
                  cursorColor: AppColor.green,
                  cursorErrorColor: AppColor.green,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.w(12),
                      ), // 6% of width
                      borderSide: BorderSide(color: AppColor.white),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                      borderSide: BorderSide(color: AppColor.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.white),
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.white),
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(Responsive.w(4)), // 2% of width
                      child: SvgPicture.asset("assets/icons/mail-02.svg"),
                    ),
                    filled: true,
                    fillColor: AppColor.feildColor,
                    hintText: "Email Address",
                    hintStyle: GoogleFonts.dmSans(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: Responsive.textScaleFactor * 14,
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFoucsChange(
                      context,
                      emailFoucsNode,
                      passwordFoucsNode,
                    );
                  },
                ),
                SizedBox(height: Responsive.h(3)),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      style: TextStyle(color: AppColor.textColor),
                      controller: passwordController,
                      focusNode: passwordFoucsNode,
                      cursorColor: AppColor.darkgreen,
                      cursorErrorColor: AppColor.darkgreen,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        focusColor: AppColor.feildColor,
                        filled: true,
                        fillColor: AppColor.feildColor,
                        hintText: "Password",
                        hintStyle: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: Responsive.textScaleFactor * 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                          borderSide: BorderSide(color: AppColor.feildColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                          borderSide: BorderSide(color: AppColor.feildColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.feildColor),
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(Responsive.w(4)),
                          child: SvgPicture.asset(
                            "assets/icons/lock-password (3).svg",
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                            _obsecurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.white,
                            size: Responsive.sp(20),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: Responsive.h(1.5)),
                GestureDetector(
                  onTap: () {
                    _showForgotPasswordBottomSheet(context, emailController);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: Responsive.w(5)),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.sp(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Responsive.h(2.5)),
                AuthButton(
                  buttontext: "Login",
                  loading: false,
                  //  authViewmodel.loading,
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.tosatMassage("Please Enter Email First");
                    } else if (passwordController.text.isEmpty) {
                      Utils.tosatMassage("Please Enter Password First");
                    } else if (passwordController.text.length < 8) {
                      Utils.tosatMassage(
                        "Please Enter 8 digits",
                        // context,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeView()),
                      );
                      // Navigator.pushReplacementNamed(context, RoutesName.role);
                      // Map<String, String> headr = {
                      //   "x-api-key": "reqres-free-v1",
                      // };
                      // Map data = {
                      //   'email': emailController.text.toString(),
                      //   'password': passwordController.text.toString(),
                      // };
                      // authViewmodel.loginApi(data, headr, context);
                    }
                  },
                ),
                SizedBox(height: Responsive.h(2)),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColor.darkgreen)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.w(3),
                      ),
                      child: Text(
                        "OR",
                        style: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.sp(10),
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColor.darkgreen)),
                  ],
                ),
                SizedBox(height: Responsive.h(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      iconPath: 'assets/icons/google.svg',
                      ontap: () {},
                    ),
                    // _buildSocialButton("assets/icons/google.svg"),
                    _buildSocialButton("assets/icons/facebook.svg"),
                    _buildSocialButton("assets/icons/apple.svg"),
                  ],
                ),
                SizedBox(height: Responsive.h(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "New here? ",
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: Responsive.sp(12),
                        ),
                        children: [
                          TextSpan(
                            text: "Create an account",
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: Responsive.sp(12),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Sginupview(),
                                  ),
                                );
                                // Navigator.pushReplacementNamed(
                                //   context,
                                //   RoutesName.signup,
                                // );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath) {
    return Container(
      height: Responsive.h(6), // 6% of screen height
      width: Responsive.w(25), // 20% of screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Responsive.w(5.5)),
        color: AppColor.darkgreen,
      ),
      child: Padding(
        padding: EdgeInsets.all(Responsive.w(3)),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}

void _showForgotPasswordBottomSheet(
  BuildContext context,
  TextEditingController email,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    backgroundColor: AppColor.green,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: Responsive.w(5),
          right: Responsive.w(5),
          top: Responsive.h(3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Forgot Password?",
              style: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: Responsive.sp(18),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Enter your registered email address. We’ll send you a link to reset your password.",
              style: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: Responsive.sp(10),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: Responsive.h(2)),
            SizedBox(
              height: Responsive.h(6),
              child: TextFormField(
                style: TextStyle(color: AppColor.white),
                controller: email,
                cursorColor: AppColor.green,
                cursorErrorColor: AppColor.green,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive.w(12),
                    ), // 6% of width
                    borderSide: BorderSide(color: AppColor.feildColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Responsive.w(12)),
                    borderSide: BorderSide(color: AppColor.feildColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.feildColor),
                    borderRadius: BorderRadius.circular(Responsive.w(12)),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(Responsive.w(3)), // 2% of width
                    child: SvgPicture.asset("assets/icons/mail-02.svg"),
                  ),
                  filled: true,
                  fillColor: AppColor.white.withValues(alpha: 0.08),
                  hintText: "Email Address",
                  hintStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: Responsive.h(2)),
            AuthButton(
              buttontext: "Send Reset Link",
              onPress: () {
                Navigator.pop(context);
                Utils.tosatMassage("Reset link sent!");
              },
              loading: false,
            ),
            SizedBox(height: Responsive.h(2)),
          ],
        ),
      );
    },
  );
}
