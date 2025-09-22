import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind_time/ui/widgets/center_circular_progress_indicator.dart';
import '../../models/user_model.dart';
import '../../services/network_caller.dart';
import '../../utils/assets_paths.dart';
import '../../utils/urls.dart';
import 'home_page.dart';
import 'package:image_picker/image_picker.dart';


class Profile_Update_Page extends StatefulWidget {
   Profile_Update_Page({super.key, required this.email, required this.password});
  static const String name = '/Profile_Update_Page';
   final  String email;
   final  String password;

  @override
  State<Profile_Update_Page> createState() => _Profile_Update_PageState();
}

class _Profile_Update_PageState extends State<Profile_Update_Page> {
  late final TextEditingController _emailTEcontroller;
  late final TextEditingController _passwordTEcontroller;
  final TextEditingController _nameTEcontroller = TextEditingController();
   final TextEditingController _phoneTEcontroller = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   bool profileUpInProgress = false;
   String selectedTimezone = "UTC";
   File? _pickedImageFile;
   String? _base64Image;
   final ImagePicker pickImage = ImagePicker();

   @override
   void initState() {
     super.initState();
     _emailTEcontroller = TextEditingController(text: widget.email);
     _passwordTEcontroller = TextEditingController(text: widget.password);
   }



   // 📌 pick image
   Future<void> _pickImage() async {
     showDialog(
       context: context,
       builder: (ctx) {
         return AlertDialog(
           title: const Text("Choose Image"),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               ListTile(
                 leading: const Icon(Icons.camera_alt),
                 title: const Text("Camera"),
                 onTap: () async {
                   Navigator.pop(ctx);
                   final picked = await pickImage.pickImage(source: ImageSource.camera, imageQuality: 80);
                   if (picked != null) {
                     _setImage(File(picked.path));
                   }
                 },
               ),
               ListTile(
                 leading: const Icon(Icons.photo),
                 title: const Text("Gallery"),
                 onTap: () async {
                   Navigator.pop(ctx);
                   final picked = await pickImage.pickImage(source: ImageSource.gallery, imageQuality: 80);
                   if (picked != null) {
                     _setImage(File(picked.path));
                   }
                 },
               ),
             ],
           ),
         );
       },
     );
   }

   // 📌 convert to base64 + set state
   void _setImage(File file) async {
     final bytes = await file.readAsBytes();
     setState(() {
       _pickedImageFile = file;
       _base64Image = base64Encode(bytes);
     });
   }


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
                           ElevatedButton.icon(onPressed: _pickImage ,icon: Icon(Icons.upload_outlined), label: Text("Upload Photo")),


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
                            enabled: false,  // 🔴 This disables the field
                            style: TextStyle(color: Colors.white70), // make it look disabled
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),

                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: _phoneTEcontroller,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              hintStyle: TextStyle(color: Colors.white54),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number cannot be empty';
                              } else if (!RegExp(r'^[0-9]{8,15}$').hasMatch(value)) {
                                return 'Enter a valid phone number';
                              }
                              return null;
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
                            Visibility(
                              visible: profileUpInProgress == false,
                              replacement: CenterCircularProgressIndicator(),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    bool result = await _profileUpdate();
                                    if (result) {
                                      Navigator.pushNamed(context, HomePage.name);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120.w, 40),
                                  backgroundColor: Color(0xFF145dfc),
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  "Complete Profile",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
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


  Future<bool> _profileUpdate() async {
    setState(() => profileUpInProgress = true);

    final requestBody = {
      "full_name": _nameTEcontroller.text.trim(),
      "email": _emailTEcontroller.text.trim(),
      "password": widget.password, // or _passwordTEcontroller.text if editable
      "mobile_no": _phoneTEcontroller.text.trim(),
      "photo_url": _base64Image ?? "",
      "time_zone": selectedTimezone,
      "notification": 0,
    };

    final response = await NetworkCaller.postRequest(
      url: Urls.signUp_URL,
      body: requestBody,
    );

    setState(() => profileUpInProgress = false);

    if (response.isSuccess) {
      final userModel = UserModel.fromJson(response.body!['data']['user']);
      final token = response.body!['data']['token'];

      Get.snackbar("Success", "Sign-up completed",
          backgroundColor: Colors.green);

      return true;
    } else {
      Get.snackbar("Error", response.errorMessage ?? "Please try again",
          backgroundColor: Colors.red);
      return false;
    }
  }


  @override
  void dispose() {
    _nameTEcontroller.dispose();
    _phoneTEcontroller.dispose();
    _emailTEcontroller.dispose();
    super.dispose();
  }
}
