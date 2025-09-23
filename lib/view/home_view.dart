import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<VideoItem> _recommendedVideos = [
    VideoItem(
      id: '1',
      imagePath: "assets/images/Frame 1410121016 (2).png",
      title: "The Healing Forest Trail",
      duration: '15 Min',
      isEnabled: true,
    ),
    VideoItem(
      id: '2',
      imagePath: "assets/images/Frame 1171275405.png",
      title: "Dental Care Basics",
      duration: '12 Min',
      isEnabled: true,
    ),
    VideoItem(
      id: '3',
      imagePath: "assets/images/Frame 1410121016 (1).png",
      title: "Advanced Procedures",
      duration: '20 Min',
      isEnabled: true,
    ),
  ];

  bool _isVideoPlaying = false;
  int _currentPlayingIndex = 0;

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
                // Section title
                _buildSectionTitle("Video Doctors"),
                const SizedBox(height: 16),

                // Playlist section
                _buildPlaylistSection(),
                const SizedBox(height: 24),

                // Video player section
                _buildVideoPlayerSection(),
                const SizedBox(height: 24),

                // Recommended section with reordering
                _buildReorderableSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayerSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.feildColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Video player placeholder
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: _isVideoPlaying
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          'Playing: ${_recommendedVideos[_currentPlayingIndex].title}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      'Video Player\nTap play to start',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
          ),
          const SizedBox(height: 12),
          
          // Playback controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _playPreviousVideo,
                icon: Icon(Icons.skip_previous),
                color: AppColor.feildColor,
              ),
              IconButton(
                onPressed: _togglePlayPause,
                icon: Icon(
                  _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                ),
                color: AppColor.feildColor,
              ),
              IconButton(
                onPressed: _playNextVideo,
                icon: Icon(Icons.skip_next),
                color: AppColor.feildColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReorderableSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle("Playlist Videos"),
            _buildToggleAllButton(),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Drag to reorder videos while playing',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 16),
        
        // Reorderable list
        Container(
          decoration: BoxDecoration(
            color: AppColor.feildColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ReorderableListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _recommendedVideos.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final VideoItem item = _recommendedVideos.removeAt(oldIndex);
                _recommendedVideos.insert(newIndex, item);
                
                // Update current playing index if needed
                if (_currentPlayingIndex == oldIndex) {
                  _currentPlayingIndex = newIndex;
                } else if (_currentPlayingIndex > oldIndex && _currentPlayingIndex <= newIndex) {
                  _currentPlayingIndex--;
                } else if (_currentPlayingIndex < oldIndex && _currentPlayingIndex >= newIndex) {
                  _currentPlayingIndex++;
                }
              });
            },
            itemBuilder: (context, index) {
              final video = _recommendedVideos[index];
              return _buildReorderableVideoItem(video, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildReorderableVideoItem(VideoItem video, int index) {
    return Container(
      key: Key(video.id),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: _currentPlayingIndex == index && _isVideoPlaying
            ? AppColor.feildColor.withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: _currentPlayingIndex == index && _isVideoPlaying
            ? Border.all(color: AppColor.feildColor)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: _buildVideoThumbnail(video.imagePath),
          title: Text(
            video.title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              decoration: video.isEnabled ? null : TextDecoration.lineThrough,
              color: video.isEnabled ? Colors.black : Colors.grey,
            ),
          ),
          subtitle: Text(
            video.duration,
            style: TextStyle(
              fontSize: 10,
              color: video.isEnabled ? Colors.grey : Colors.grey[400],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Toggle button
              IconButton(
                icon: Icon(
                  video.isEnabled ? Icons.toggle_on : Icons.toggle_off,
                  color: video.isEnabled ? AppColor.darkgreen : Colors.grey,
                  size: 40,
                ),
                onPressed: () => _toggleVideoEnabled(video.id),
              ),
              // Drag handle
              Icon(
                Icons.drag_handle,
                color: Colors.grey[400],
              ),
            ],
          ),
          onTap: () => _playVideoAtIndex(index),
        ),
      ),
    );
  }

  Widget _buildVideoThumbnail(String imagePath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildToggleAllButton() {
    final allEnabled = _recommendedVideos.every((video) => video.isEnabled);
    final someEnabled = _recommendedVideos.any((video) => video.isEnabled);
    
    return TextButton.icon(
      onPressed: _toggleAllVideos,
      icon: Icon(
        allEnabled ? Icons.toggle_on : Icons.toggle_off,
        color: someEnabled ? AppColor.darkgreen : Colors.grey,size: 40,
      ),
      label: Text(
        allEnabled ? 'All On' : 'All Off',
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  void _toggleVideoEnabled(String videoId) {
    setState(() {
      final video = _recommendedVideos.firstWhere((v) => v.id == videoId);
      video.isEnabled = !video.isEnabled;
    });
  }

  void _toggleAllVideos() {
    setState(() {
      final allEnabled = _recommendedVideos.every((video) => video.isEnabled);
      for (final video in _recommendedVideos) {
        video.isEnabled = !allEnabled;
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  void _playVideoAtIndex(int index) {
    setState(() {
      _currentPlayingIndex = index;
      _isVideoPlaying = true;
    });
  }

  void _playNextVideo() {
    setState(() {
      if (_currentPlayingIndex < _recommendedVideos.length - 1) {
        _currentPlayingIndex++;
        _isVideoPlaying = true;
      }
    });
  }

  void _playPreviousVideo() {
    setState(() {
      if (_currentPlayingIndex > 0) {
        _currentPlayingIndex--;
        _isVideoPlaying = true;
      }
    });
  }

  // Keep your existing methods...
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
                '${_recommendedVideos.length} Videos',
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
}

class VideoItem {
  final String id;
  final String imagePath;
  final String title;
  final String duration;
  bool isEnabled;

  VideoItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.isEnabled,
  });
}



















// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider_tamplete/res/components/app_color.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // App logo/icon
//                 // SvgPicture.asset("assets/icons/Group 2 (2).svg"),
//                 // const SizedBox(height: 16),

//                 // // Search and filter row
//                 // _buildSearchRow(),
//                 // const SizedBox(height: 24),

//                 // Section title
//                 _buildSectionTitle("Video Doctors"),
//                 const SizedBox(height: 16),

//                 // Playlist section
//                 _buildPlaylistSection(),
//                 const SizedBox(height: 24),

//                 // Recommended section
//                 _buildRecommendedSection(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget _buildSearchRow() {
//   //   return Row(
//   //     children: [
//   //       Expanded(
//   //         child: TextFormField(
//   //           decoration: InputDecoration(
//   //             prefixIcon: Padding(
//   //               padding: const EdgeInsets.all(12.0),
//   //               child: SvgPicture.asset(
//   //                 "assets/icons/search.svg",
//   //                 width: 10,
//   //                 height: 10,
//   //               ),
//   //             ),
//   //             hintText: "Search ...",
//   //             fillColor: AppColor.feildColor,
//   //             filled: true,
//   //             border: OutlineInputBorder(
//   //               borderRadius: BorderRadius.circular(18),
//   //               borderSide: BorderSide(color: AppColor.feildColor),
//   //             ),
//   //             errorBorder: OutlineInputBorder(
//   //               borderRadius: BorderRadius.circular(18),
//   //               borderSide: BorderSide(color: AppColor.feildColor),
//   //             ),
//   //             focusedBorder: OutlineInputBorder(
//   //               borderRadius: BorderRadius.circular(18),
//   //               borderSide: BorderSide(color: AppColor.feildColor),
//   //             ),
//   //             enabledBorder: OutlineInputBorder(
//   //               borderRadius: BorderRadius.circular(18),
//   //               borderSide: BorderSide(color: AppColor.feildColor),
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //       const SizedBox(width: 12),
//   //       Container(
//   //         decoration: BoxDecoration(
//   //           gradient: AppColor.multicolor,
//   //           borderRadius: BorderRadius.circular(12),
//   //         ),
//   //         child: Padding(
//   //           padding: const EdgeInsets.all(12.0),
//   //           child: Center(child: SvgPicture.asset("assets/icons/filter.svg")),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         color: Colors.black,
//         fontSize: 14,
//         fontFamily: 'Rethink Sans',
//         fontWeight: FontWeight.w600,
//         letterSpacing: -0.30,
//       ),
//     );
//   }

//   Widget _buildPlaylistSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SvgPicture.asset("assets/images/Frame 1410121029.svg"),
//         const SizedBox(height: 12),

//         // Video info row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Title and duration
//             Row(
//               children: [
//                 Text(
//                   'Dentist Procedure',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontFamily: 'Rethink Sans',
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: -0.30,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SvgPicture.asset("assets/icons/Ellipse 3.svg"),
//                 const SizedBox(width: 8),
//                 Text(
//                   '15 Min',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 10,
//                     fontFamily: 'Rethink Sans',
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: -0.30,
//                   ),
//                 ),
//               ],
//             ),

//             // Watch button
//             Row(
//               children: [
//                 Text(
//                   'Watch',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..shader = LinearGradient(
//                         colors: [Color(0xFF31B0B5), Color(0xFF9AC381)],
//                       ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 SvgPicture.asset("assets/icons/bxs_up-arrow.svg"),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),

//         // Video count container
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: AppColor.feildColor,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '5 Videos',
//                 style: TextStyle(
//                   color: const Color(0xFF6F6F6F),
//                   fontSize: 12,
//                   fontFamily: 'DM Sans',
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: -0.30,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRecommendedSection(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle("Recommended for You"),
//         const SizedBox(height: 16),

//         // Recommended video items
//         _buildVideoItem(
//           "assets/images/Frame 1410121016 (2).png",
//           "The Healing Forest Trail",
//           context,
//         ),
//         const SizedBox(height: 16),

//         _buildVideoItem(
//           "assets/images/Frame 1171275405.png",
//           "The Healing Forest Trail",
//           context,
//         ),
//         const SizedBox(height: 16),

//         _buildVideoItem(
//           "assets/images/Frame 1410121016 (1).png",
//           "The Healing Forest Trail",
//           context,
//         ),
//       ],
//     );
//   }

//   Widget _buildVideoItem(String imagePath, String title, BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(imagePath),
//         const SizedBox(height: 12),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Title and duration
//             Row(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12,
//                       fontFamily: 'Rethink Sans',
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: -0.30,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SvgPicture.asset("assets/icons/Ellipse 3.svg"),
//                 const SizedBox(width: 8),
//                 Text(
//                   '15 Min',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 10,
//                     fontFamily: 'Rethink Sans',
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: -0.30,
//                   ),
//                 ),
//               ],
//             ),

//             // Watch button
//             Row(
//               children: [
//                 Text(
//                   'Watch',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..shader = LinearGradient(
//                         colors: [Color(0xFF31B0B5), Color(0xFF9AC381)],
//                       ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 SvgPicture.asset("assets/icons/bxs_up-arrow.svg"),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
