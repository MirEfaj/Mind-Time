import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/assets_paths.dart';
import 'home_page.dart';

class Profile_Update_Page extends StatefulWidget {
   Profile_Update_Page({super.key});
  static const String name = '/Profile_Update_Page';

  @override
  State<Profile_Update_Page> createState() => _Profile_Update_PageState();
}

class _Profile_Update_PageState extends State<Profile_Update_Page> {
   final TextEditingController _emailTEcontroller = TextEditingController();
   final TextEditingController _nameTEcontroller = TextEditingController();
   final TextEditingController _phoneTEcontroller = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   bool signInProgress = false;

   String selectedTimezone = "UTC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            heightFactor: .9,
            widthFactor: .9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(20),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: Colors.white.withAlpha(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Image.asset(AssetsPath.logoImg, height: 120.h, width: 120.w,),

                          Text("Complete Your Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),

                          Text(
                            "Help us personalize your experience",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          CircleAvatar(
                            backgroundColor: Colors.white24,
                            radius: 40.r,
                            child: Icon(Icons.camera_alt_outlined, color: Colors.white,size: 25.w,),
                          ),
                          SizedBox(height: 5.h),
                           ElevatedButton.icon(onPressed: (){},icon: Icon(Icons.upload_outlined), label: Text("Upload Photo")),


                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: _nameTEcontroller,
                            style: TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Enter your full-name",
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "full-name is required";
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: _emailTEcontroller,
                            style: TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Enter Your Email",
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Email is required";
                              if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) return "Enter a valid email";
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          TextFormField(
                              controller: _phoneTEcontroller,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Enter your phone number",
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                  return 'Password must contain at least one uppercase letter';
                                } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return 'Password must contain at least one number';
                                }
                                return null; // ✅ valid password
                              },
                            ),
                          SizedBox(height: 10.h),

                          DropdownButtonFormField<String>(
                          initialValue: selectedTimezone,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white12,
                          ),
                          dropdownColor: const Color(0xFF0E2845),
                          iconEnabledColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          items: [
                            "UTC",
                            "GMT",
                            "EST (UTC-5)",
                            "CST (UTC-6)",
                            "MST (UTC-7)",
                            "PST (UTC-8)",
                            "IST (UTC+5:30)",
                            "BST (UTC+6)",
                            "CET (UTC+1)",
                            "EET (UTC+2)",
                            "JST (UTC+9)",
                            "AEST (UTC+10)"
                          ].map((tz) => DropdownMenuItem(
                            value: tz,
                            child: Text(tz),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedTimezone = value!;
                            });
                          },
                        ),

                          SizedBox(height: 20.w),



                        Row(
                          children: [
                            ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(120.w, 40),
                                    backgroundColor: Colors.white10,
                                    padding: EdgeInsets.symmetric(vertical: 14.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Text("Back",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,

                                    ),
                                  ),
                                ),
                            SizedBox(width: 25.w),
                            ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushNamed(context, HomePage.name);
                                    }
                                    Navigator.pushNamed(context, HomePage.name);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(120.w, 40),
                                    backgroundColor: Color(0xFF145dfc),
                                    padding: EdgeInsets.symmetric(vertical: 14.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Text("Complete Profile",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,

                                    ),
                                  ),
                                ),
                          ],
                        ),
                          SizedBox(height: 15.h),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _nameTEcontroller.dispose();
    _phoneTEcontroller.dispose();
    _emailTEcontroller.dispose();
    super.dispose();
  }
}
