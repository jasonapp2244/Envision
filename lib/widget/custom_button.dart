import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  // final Color backgroundColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final TextStyle? textStyle;
  final double elevation;
  final Color? textColor;
  final double? fontSize;
  final Widget? suffixIcon; // 👈 NEW PARAM

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    // this.backgroundColor = const Color(0xFF7B6EF6),
    this.width,
    this.height,
    this.borderRadius = 24,
    this.textStyle,
    this.elevation = 0,
    this.textColor,
    this.fontSize,
    this.suffixIcon, // 👈 include in constructor
  });

  @override
  Widget build(BuildContext context) {
    Widget button = GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: [Color(0xFF31B0B5), Color(0xFF9AC381)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize ?? 14,
                  ),
            ),
          ),
        ),
      ),
    );

    // ElevatedButton(
    //   :onPressed onPressed,
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //     backgroundColor: backgroundColor,

    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(borderRadius),
    //     ),
    //     elevation: elevation,
    //     fixedSize: (width != null && height != null && width != double.infinity)
    //         ? Size(width!, height!)
    //         : null,
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       if (suffixIcon != null) ...[
    //         SizedBox(width: 8),
    //         suffixIcon!, // 👈 suffix icon widget
    //       ],
    //       SizedBox(width: 10),
    //       Text(
    //         text,
    //         style:
    //             textStyle ??
    //             TextStyle(
    //               color: textColor ?? Colors.white,
    //               fontWeight: FontWeight.w700,
    //               fontSize: fontSize ?? 14,
    //             ),
    //       ),
    //     ],
    //   ),
    // );

    // if (width == double.infinity) {
    //   return SizedBox(width: double.infinity, height: height, child: button);
    // }

    return button;
  }
}
