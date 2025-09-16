import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? iconPath;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePassword;

  CustomTextField({
    super.key,
    required this.hintText,
    this.iconPath,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          // ✅ Shadow added here
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(iconPath!),
            SizedBox(width: 12),
          ],
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword ? !isPasswordVisible : obscureText,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColor.textColor, fontSize: 14),
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                suffixIcon: isPassword && onTogglePassword != null
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColor.textColor,
                        ),
                        onPressed: onTogglePassword,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
