
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:responsive_adaptive_ui/responsive_adaptive_ui.dart';
class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback ontap;
  const SocialButton({super.key, required this.iconPath, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
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
      ),
    );
  }
}
