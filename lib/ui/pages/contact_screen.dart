import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_time/ui/pages/sign_in_page.dart';

import '../../utils/assets_paths.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  static const String name = '/ContactScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            heightFactor: .48,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Image.asset(AssetsPath.logoImg, height: 120.h, width: 120.w,),

                        Text("We're on it!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.h),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("A MindTime Coach will contact you within 24 hours. You can now exit the app or go back and modify your answers."),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded( flex: 4 ,child: ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff145dfc)
                                ),
                                child: Text("Take me back"))),
                            SizedBox(width: 10.w),
                            Expanded(flex: 4 ,child: ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, SignInPage.name);
                            }, child: Text("Exit"))),
                          ],
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
    );
  }
}
