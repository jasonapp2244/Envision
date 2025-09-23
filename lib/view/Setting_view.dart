import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/images.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Setting',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Rethink Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.10,
                ),
              ),

              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RoutesName.chnagePassword),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.filled_lock_password),
                        Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RoutesName.activitylogsView),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.idea),
                        Text(
                          "Activity logs",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                // onTap: () =>
                //     Navigator.pushNamed(context, RoutesName.activitylogsView),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.video_collection_outlined,
                          color: Colors.grey,
                        ),
                        // SvgPicture.asset(AppImages.idea),
                        Text(
                          "Request a Video",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RoutesName.activitylogsView),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.eye),
                        Text(
                          "Last viewed content",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                // onTap: () =>
                //     Navigator.pushNamed(context, RoutesName.activitylogsView),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.support_agent_sharp, color: Colors.grey),

                        // SvgPicture.asset(AppImages.idea),
                        Text(
                          "Tech Support",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //   context,
                //   RoutesName.lastviewedcontentview,
                // ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(AppImages.eye),
                        Icon(
                          Icons.connect_without_contact_sharp,
                          color: Colors.grey,
                        ),

                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                // onTap: () =>
                //     Navigator.pushNamed(context, RoutesName.activitylogsView),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.feildColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(AppImages.idea),
                        Icon(Icons.feed_outlined, color: Colors.grey),
                        Text(
                          "Feedback",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
