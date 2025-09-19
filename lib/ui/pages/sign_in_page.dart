import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/assets_paths.dart';
import 'forgot_password_screen.dart';
import 'home_page.dart';
import 'sign_up_screen.dart';
import 'task_completion_save_congratulation_screen.dart';

class SignInPage extends StatefulWidget {
   SignInPage({super.key});
  static const String name = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
   final TextEditingController _emailTEcontroller = TextEditingController();
   final TextEditingController _passwordTEcontroller = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   bool signInProgress = false;

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

                          Text("Welcome to MindTrack",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),

                          Text(
                            "40 Days of Spiritual Practices to Renew Your Mind, Heart and Life.",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.h),

                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Click Here to: ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                  "Watch a quick video explaining what this 40 day journey is all about.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20.h),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                // TODO: add Google Sign-In logic
                              },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Image.asset(AssetsPath.googleImg, height: 20.h, width: 20.w,),
                                  SizedBox(width: 10.w),

                                  Text("Continue with Google",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          SizedBox(height: 20.h),

                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.white54)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text("or",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.white54)),
                            ],
                          ),

                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: _emailTEcontroller,
                            style: TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email address",
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Email is required";
                              if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) return "Enter a valid email";
                              return null;
                            },
                          ),

                          SizedBox(height: 15.h),
                          TextFormField(
                              controller: _passwordTEcontroller,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Password",
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


                          SizedBox(height: 20.h),


                         ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, HomePage.name);
                                }
                                Navigator.pushNamed(context, HomePage.name);

                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 40),
                                backgroundColor: Color(0xFF145dfc),
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text("Sign In",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,

                                ),
                              ),
                            ),


                          SizedBox(height: 15.h),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpPage.name);
                            },
                            child: Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ForgotPassPage.name);
                            },
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
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
     _emailTEcontroller.dispose();
     _passwordTEcontroller.dispose();
     super.dispose();
   }
}
