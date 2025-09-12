import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/view/doctor_view.dart';
import 'package:provider_tamplete/view/home_view.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: buildSearchRow(),

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue, // Customize as needed
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Videos'),
            Tab(text: 'Doctors'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeView(), // Your existing home view with videos
          DoctorView(), // Your doctor view
        ],
      ),
    );
  }
}

Widget buildSearchRow() {
  return Column(
    children: [
       SvgPicture.asset("assets/icons/Group 2 (2).svg"),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                    width: 10,
                    height: 10,
                  ),
                ),
                hintText: "Search doctors...",
                fillColor: AppColor.feildColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.feildColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.feildColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.feildColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.feildColor),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              gradient: AppColor.multicolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: SvgPicture.asset("assets/icons/filter.svg")),
            ),
          ),
        ],
      ),
    ],
  );
}
