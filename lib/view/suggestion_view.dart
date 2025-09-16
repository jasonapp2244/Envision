import 'package:flutter/material.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';

class ContentPreferenceScreen extends StatefulWidget {
  const ContentPreferenceScreen({super.key});

  @override
  State<ContentPreferenceScreen> createState() =>
      _ContentPreferenceScreenState();
}

class _ContentPreferenceScreenState extends State<ContentPreferenceScreen> {
  final List<String> _selectedCategories = [];

  final List<Map<String, dynamic>> _categories = [
    {'title': 'Nature & Scenery', 'icon': "🌿"},
    {'title': 'Comedy Shorts', 'icon': '😂'},
    {'title': 'Documentaries', 'icon': "📚"},
    {'title': 'Art & Animation', 'icon': "🎨"},
    {'title': 'Dental Care Tips', 'icon': '🎥'},
    {'title': 'Space & Universe', 'icon': '🌌'},
    {'title': 'Flowers in Bloom', 'icon': '🌺'},
    {'title': 'Aquarium Life', 'icon': '🐠'},
    {'title': 'Sky Timelapse', 'icon': '⛅'},
    {'title': 'Meditation & Breathing', 'icon': '🧘'},
    {'title': 'Fireplace & Rain', 'icon': '🔥'},
    {'title': 'Cute Animals', 'icon': '🐾'},
  ];

  void _toggleCategory(String category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subtitle
                  const Text(
                    'What Kind Of Videos Do\nYou Like?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  const Text(
                    'Choose as many as you want. We\'ll build your playlist.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Duration options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDurationOption('15 Min', width: 100),
                      _buildDurationOption('30 Min', width: 100),
                      _buildDurationOption('45 Min', width: 100),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Category grid
                  // Expanded(
                  //   child:
                  // ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio:
                              158 / 56, // Based on the design proportions
                        ),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = _selectedCategories.contains(
                        category['title'],
                      );

                      return _buildCategoryButton(
                        category['title'] as String,
                        isSelected,
                        category['icon'] as String,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // Continue button
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      RoutesName.mainScreenHolder,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: AppColor.multicolor,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Rethink Sans',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDurationOption(String text, {required double width}) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, bool isSelected, String icon) {
    return ElevatedButton(
      onPressed: () => _toggleCategory(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[100],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.white,
            width: 1,
          ),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: Row(
        children: [
          Text(icon),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider_tamplete/res/components/app_color.dart';
// import 'package:responsive_adaptive_ui/responsive_adaptive_ui.dart';

// class SuggestionView extends StatelessWidget {
//   const SuggestionView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Responsive.init(context);
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             SvgPicture.asset("assetName"),
//             Text(
//               'What kind of videos do \nyou like?',
//               style: GoogleFonts.rethinkSans(
//                 color: Colors.black,
//                 fontSize: Responsive.textScaleFactor * 25,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: -0.10,
//               ),
//             ),
//             Text(
//               'Choose as many as you want. We’ll build your playlist.',
//               style: GoogleFonts.inter(
//                 color: Colors.black,
//                 fontSize:Responsive.textScaleFactor * 12,
//                 fontWeight: FontWeight.w400,
//                 letterSpacing: -0.60,
//               ),
//             ),
           
//           ],
//         ),
//       ),
//     );
//   }
// }
