import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/images.dart';

class LastViewedContentView extends StatelessWidget {
  const LastViewedContentView({super.key});

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

                  child: SvgPicture.asset(AppImages.arrowBack),
                ),
                Text(
                  "Last viewed content",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor,
                  ),
                ),
              ],
            ),
            _buildRecommendedSection(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildRecommendedSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // _buildSectionTitle("Recommended for You"),
      // const SizedBox(height: 16),

      // Recommended video items
      _buildVideoItem(
        "assets/images/Frame 1410121016 (2).png",
        "The Healing Forest Trail",
        context,
      ),
      const SizedBox(height: 16),

      _buildVideoItem(
        "assets/images/Frame 1171275405.png",
        "The Healing Forest Trail",
        context,
      ),
      const SizedBox(height: 16),

      _buildVideoItem(
        "assets/images/Frame 1410121016 (1).png",
        "The Healing Forest Trail",
        context,
      ),
    ],
  );
}

Widget _buildVideoItem(String imagePath, String title, BuildContext context) {
  return Column(
    children: [
      Image.asset(imagePath),
      const SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title and duration
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Rethink Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.30,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset("assets/icons/Ellipse 3.svg"),
              const SizedBox(width: 8),
              Text(
                '15 Min',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'Rethink Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.30,
                ),
              ),
            ],
          ),

          // Watch button
          Row(
            children: [
              Text(
                'Watch',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [Color(0xFF31B0B5), Color(0xFF9AC381)],
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset("assets/icons/bxs_up-arrow.svg"),
            ],
          ),
        ],
      ),
    ],
  );
}
