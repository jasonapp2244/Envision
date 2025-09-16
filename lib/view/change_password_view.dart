import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/images.dart';
import 'package:provider_tamplete/utils/routes/utils.dart';
import 'package:provider_tamplete/widget/custom_button.dart';
import 'package:provider_tamplete/widget/textfeild.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(spacing: 12,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AppImages.arrowBack)),
                  Text(
                    "Change Password",
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "Your password must be at least six characters and should include a\n"
                "combination of numbers, letters and special characters (!\$@%)",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
          
              // Old Password
              CustomTextField(
                controller: oldPasswordController,
                hintText: 'Old Password',
                iconPath: AppImages.lock_password,
                obscureText: true,
              ),
          
              SizedBox(height: 5),
          
              // New Password
              CustomTextField(
                controller: newPasswordController,
                hintText: 'New Password',
                iconPath: AppImages.lock_password,
                obscureText: true,
              ),
          
              SizedBox(height: 5),
          
              // Confirm Password
              CustomTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm New Password',
                iconPath: AppImages.lock_password,
                obscureText: true,
              ),
          
              Spacer(),
          
              // Save Button
              CustomButton(
                width: double.infinity,
                text: 'Save',
                onPressed: () {
                  _changePassword(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePassword(BuildContext context) {
    // Validate passwords
    if (oldPasswordController.text.isEmpty) {
      Utils.flushBarErrorMassage("Please enter your old password", context);

      return;
    }

    if (newPasswordController.text.isEmpty) {
      Utils.flushBarErrorMassage("Please enter your new password", context);

      return;
    }

    if (newPasswordController.text.length < 6) {
      Utils.flushBarErrorMassage(
        "New password must be at least 6 characters",
        context,
      );

      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Utils.flushBarErrorMassage("Passwords do not match", context);

      return;
    }

    // Here you would typically make an API call to change the password
    print('Changing password...');
    print('Old Password: ${oldPasswordController.text}');
    print('New Password: ${newPasswordController.text}');

    // Show success message
    Utils.flushBarErrorMassage(
      "New password must be at least 6 characters",
      context,
    );

    // Get.snackbar(
    //   'Success',
    //   'Password changed successfully',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    // );

    // Navigate back
    // Get.back();
    Navigator.pop(context);
  }
}
