import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/view/loginview.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkgreen,
      appBar: AppBar(
        backgroundColor: AppColor.darkgreen,
        title: Text("Your Profile", style: TextStyle(color: AppColor.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  color: AppColor.white,
                ),
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.85,
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "John",
                              style: GoogleFonts.dmSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.darkgreen,
                              ),
                            ),
                            Text(
                              "john@gmail.com",
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: AppColor.textColor,
                              ),
                            ),
                            Text(
                              "Dentist",
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: AppColor.textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: AppColor.darkgreen,
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: AppColor.feildColor,
                        filled: true,
                        suffixIcon: Icon(
                          Icons.person,
                          color: AppColor.darkgreen,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: AppColor.darkgreen,
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: AppColor.feildColor,
                        filled: true,
                        suffixIcon: Icon(Icons.mail, color: AppColor.darkgreen),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Designation",
                        labelStyle: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: AppColor.darkgreen,
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: AppColor.feildColor,
                        filled: true,
                        suffixIcon: Icon(
                          Icons.panorama,
                          color: AppColor.darkgreen,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: AppColor.darkgreen,
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: AppColor.feildColor,
                        filled: true,
                        suffixIcon: Icon(
                          Icons.password,
                          color: AppColor.darkgreen,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.darkgreen),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.darkgreen,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Update",
                            style: GoogleFonts.dmSans(
                              color: AppColor.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Loginview()),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "logout",
                              style: GoogleFonts.dmSans(
                                color: AppColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
