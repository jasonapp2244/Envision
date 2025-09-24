// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider_tamplete/res/components/app_color.dart';
// import 'package:provider_tamplete/view/doctor_view.dart';
// import 'package:provider_tamplete/view/home_view.dart';

// class MianTab extends StatefulWidget {
//   const MianTab({super.key});

//   @override
//   State<MianTab> createState() => _MianTabState();
// }

// class _MianTabState extends State<MianTab> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Remove DefaultTabController
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SvgPicture.asset("assets/icons/Group 2 (2).svg"),
//               const SizedBox(height: 16),

//               // Search and filter row
//               _buildSearchRow(),
//               const SizedBox(height: 16),

//               // Tab bar
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColor.feildColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TabBar(
//                   controller: _tabController, // Use your controller
//                   // indicator: BoxDecoration(

//                   //   borderRadius: BorderRadius.circular(8),
//                   //   color: Colors.blue, // Customize with your AppColor
//                   // ),
//                   indicatorColor: AppColor.darkgreen,
//                   labelColor: AppColor.darkgreen,
//                   unselectedLabelColor: Colors.black,
//                   tabs: const [
//                     Tab(text: 'Videos'),
//                     Tab(text: 'Options'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Tab bar view
//               Expanded(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: const [HomeView(), DoctorView()],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchRow() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             decoration: InputDecoration(
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SvgPicture.asset(
//                   width: 10,
//                   height: 10,
//                   "assets/icons/search.svg",
//                 ),
//               ),
//               hintText: "Search ...",
//               fillColor: AppColor.feildColor,
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide(color: AppColor.feildColor),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide(color: AppColor.feildColor),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide(color: AppColor.feildColor),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide(color: AppColor.feildColor),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 5),
//         Container(
//           decoration: BoxDecoration(
//             gradient: AppColor.multicolor,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Center(child: SvgPicture.asset("assets/icons/filter.svg")),
//           ),
//         ),
//       ],
//     );
//   }
// }











// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:provider_tamplete/res/components/app_color.dart';
// // import 'package:provider_tamplete/view/doctor_view.dart';

// // class MianTab extends StatefulWidget {
// //   const MianTab({super.key});

// //   @override
// //   State<MianTab> createState() => _MianTabState();
// // }

// // class _MianTabState extends State<MianTab> with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 2,
// //       child: Scaffold(
// //         backgroundColor: AppColor.white,
// //         body: SafeArea(
// //           child: Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: Column(
// //               children: [
// //                 SvgPicture.asset("assets/icons/Group 2 (2).svg"),
// //                 const SizedBox(height: 16),
                
// //                 // Search and filter row
// //                 _buildSearchRow(),
// //                 const SizedBox(height: 16),
                
// //                 // Tab bar
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: AppColor.feildColor,
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                   child: TabBar(
// //                     controller: _tabController,
// //                     indicator: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(8),
// //                       color: Colors.blue, // Customize with your AppColor
// //                     ),
// //                     labelColor: Colors.white,
// //                     unselectedLabelColor: Colors.black,
// //                     tabs: const [
// //                       Tab(text: 'Videos'),
// //                       Tab(text: 'Doctors'),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(height: 16),
                
// //                 // Tab bar view
// //                 Expanded(
// //                   child: TabBarView(
// //                     controller: _tabController,
// //                     children: const [
// //                       // Videos content
// //                       SingleChildScrollView(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             // Your existing videos content here...
// //                             Text(
// //                               'Play List',
// //                               style: TextStyle(
// //                                 color: Colors.black,
// //                                 fontSize: 14,
// //                                 fontFamily: 'Rethink Sans',
// //                                 fontWeight: FontWeight.w600,
// //                                 letterSpacing: -0.30,
// //                               ),
// //                             ),
// //                             // ... rest of your videos content
// //                           ],
// //                         ),
// //                       ),
                      
// //                       // Doctors content
// //                       DoctorView(), // Your doctor grid view
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSearchRow() {
// //     return Row(
// //       children: [
// //         Expanded(
// //           child: TextFormField(
// //             decoration: InputDecoration(
// //               prefixIcon: Padding(
// //                 padding: const EdgeInsets.all(12.0),
// //                 child: SvgPicture.asset(
// //                   width: 10,
// //                   height: 10,
// //                   "assets/icons/search.svg",
// //                 ),
// //               ),
// //               hintText: "Search ...",
// //               fillColor: AppColor.feildColor,
// //               filled: true,
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(18),
// //                 borderSide: BorderSide(color: AppColor.feildColor),
// //               ),
// //               errorBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(18),
// //                 borderSide: BorderSide(color: AppColor.feildColor),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(18),
// //                 borderSide: BorderSide(color: AppColor.feildColor),
// //               ),
// //               enabledBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(18),
// //                 borderSide: BorderSide(color: AppColor.feildColor),
// //               ),
// //             ),
// //           ),
// //         ),
// //         const SizedBox(width: 5),
// //         Container(
// //           decoration: BoxDecoration(
// //             gradient: AppColor.multicolor,
// //             borderRadius: BorderRadius.circular(12),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: Center(
// //               child: SvgPicture.asset("assets/icons/filter.svg"),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }














// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:provider_tamplete/res/components/app_color.dart';
// // import 'package:provider_tamplete/view/doctor_view.dart';
// // import 'package:provider_tamplete/view/home_view.dart';

// // class MainTabScreen extends StatefulWidget {
// //   const MainTabScreen({super.key});

// //   @override
// //   State<MainTabScreen> createState() => _MainTabScreenState();
// // }

// // class _MainTabScreenState extends State<MainTabScreen>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         title: buildSearchRow(),

// //         bottom: TabBar(
// //           controller: _tabController,
// //           indicatorColor: Colors.blue, // Customize as needed
// //           labelColor: Colors.black,
// //           unselectedLabelColor: Colors.grey,
// //           tabs: const [
// //             Tab(text: 'Videos'),
// //             Tab(text: 'Doctors'),
// //           ],
// //         ),
// //       ),
// //       body: TabBarView(
// //         controller: _tabController,
// //         children: const [
// //           MianTab(), // Your existing home view with videos
// //           DoctorView(), // Your doctor view
// //         ],
// //       ),
// //     );
// //   }
// // }

// // Widget buildSearchRow() {
// //   return Column(
// //     children: [
// //        SvgPicture.asset("assets/icons/Group 2 (2).svg"),
// //       Row(
// //         children: [
// //           Expanded(
// //             child: TextFormField(
// //               decoration: InputDecoration(
// //                 prefixIcon: Padding(
// //                   padding: const EdgeInsets.all(12.0),
// //                   child: SvgPicture.asset(
// //                     "assets/icons/search.svg",
// //                     width: 10,
// //                     height: 10,
// //                   ),
// //                 ),
// //                 hintText: "Search doctors...",
// //                 fillColor: AppColor.feildColor,
// //                 filled: true,
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(18),
// //                   borderSide: BorderSide(color: AppColor.feildColor),
// //                 ),
// //                 errorBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(18),
// //                   borderSide: BorderSide(color: AppColor.feildColor),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(18),
// //                   borderSide: BorderSide(color: AppColor.feildColor),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(18),
// //                   borderSide: BorderSide(color: AppColor.feildColor),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 12),
// //           Container(
// //             decoration: BoxDecoration(
// //               gradient: AppColor.multicolor,
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.all(12.0),
// //               child: Center(child: SvgPicture.asset("assets/icons/filter.svg")),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ],
// //   );
// // }
