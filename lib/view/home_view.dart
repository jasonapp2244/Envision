
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App logo/icon
                // SvgPicture.asset("assets/icons/Group 2 (2).svg"),
                // const SizedBox(height: 16),

                // // Search and filter row
                // _buildSearchRow(),
                // const SizedBox(height: 24),

                // Section title
                _buildSectionTitle("Video Doctors"),
                const SizedBox(height: 16),

                // Playlist section
                _buildPlaylistSection(),
                const SizedBox(height: 24),

                // Recommended section
                _buildRecommendedSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildSearchRow() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: TextFormField(
  //           decoration: InputDecoration(
  //             prefixIcon: Padding(
  //               padding: const EdgeInsets.all(12.0),
  //               child: SvgPicture.asset(
  //                 "assets/icons/search.svg",
  //                 width: 10,
  //                 height: 10,
  //               ),
  //             ),
  //             hintText: "Search ...",
  //             fillColor: AppColor.feildColor,
  //             filled: true,
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(18),
  //               borderSide: BorderSide(color: AppColor.feildColor),
  //             ),
  //             errorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(18),
  //               borderSide: BorderSide(color: AppColor.feildColor),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(18),
  //               borderSide: BorderSide(color: AppColor.feildColor),
  //             ),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(18),
  //               borderSide: BorderSide(color: AppColor.feildColor),
  //             ),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(width: 12),
  //       Container(
  //         decoration: BoxDecoration(
  //           gradient: AppColor.multicolor,
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Center(child: SvgPicture.asset("assets/icons/filter.svg")),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Rethink Sans',
        fontWeight: FontWeight.w600,
        letterSpacing: -0.30,
      ),
    );
  }

  Widget _buildPlaylistSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/images/Frame 1410121029.svg"),
        const SizedBox(height: 12),

        // Video info row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and duration
            Row(
              children: [
                Text(
                  'Dentist Procedure',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Rethink Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.30,
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
        const SizedBox(height: 12),

        // Video count container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.feildColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '5 Videos',
                style: TextStyle(
                  color: const Color(0xFF6F6F6F),
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Recommended for You"),
        const SizedBox(height: 16),

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
}
