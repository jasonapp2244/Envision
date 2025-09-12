import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_tamplete/res/components/app_color.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Search and filter row (similar to your HomeView)
              buildSearchRow(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return _buildDoctorCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchRow() {
    return Row(
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
            child: Center(
              child: SvgPicture.asset("assets/icons/filter.svg"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.feildColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor avatar and basic info
          Center(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 30, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 12),
          
          // Name and rating row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Dr. Jakob Saris',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Rethink Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.30,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/material-symbols_star.svg",
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '4.9',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                      height: 1.33,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          
          // Specialty
          Text(
            'Cardiologist',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.60,
            ),
          ),
          const SizedBox(height: 8),
          
          // Divider
          const Divider(color: Colors.grey, height: 1),
          const SizedBox(height: 8),
          
          // Location
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/location.svg",
                width: 12,
                height: 12,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  'NY, 3.2 miles away',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.60,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // View Profile Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              gradient: AppColor.multicolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'View profile',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}