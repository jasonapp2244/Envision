import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String? buttontext;
  final bool loading;
  final VoidCallback onPress;
  const AuthButton({
    super.key,
    required this.buttontext,
    required this.loading,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width:double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: AppColor.multicolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: loading
                ? CustomLoadingAnimation()
                : Text(
                    buttontext.toString(),
                    style: TextStyle(color: AppColor.white),
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: MediaQuery.sizeOf(context).height * 0.02,
    );
  }
}
