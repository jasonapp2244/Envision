import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/images.dart';

class ActivitylogsView extends StatelessWidget {
  const ActivitylogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(AppImages.arrowBack)),
                Text(
                  'Activity Logs',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Rethink Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.10,
                  ),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: AppColor.feildColor,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "August 18, 2025",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "9:15 Am",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text(
                          "Online",
                          style: TextStyle(color: AppColor.lightgreen),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "9:15 Am",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text("Online", style: TextStyle(color: AppColor.red)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10:24 PM",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text(
                          "Online",
                          style: TextStyle(color: AppColor.lightgreen),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1:10 PM",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text("Online", style: TextStyle(color: AppColor.red)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "3:20 PM",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text(
                          "Online",
                          style: TextStyle(color: AppColor.lightgreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColor.feildColor,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "August 17, 2025",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1:10 PM",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text("Online", style: TextStyle(color: AppColor.red)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "3:20 PM",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Text(
                          "Online",
                          style: TextStyle(color: AppColor.lightgreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
