import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/assets_paths.dart';
import 'contact_screen.dart';
import 'sign_in_page.dart';

class TaskCompletionSaveCongratulationScreen extends StatelessWidget {
  const TaskCompletionSaveCongratulationScreen({super.key});
  static const String name = '/TaskCompletionSaveCongratulationScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            heightFactor: .68,
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

                        Text("Well Done! You complete Day 1 👏👏👏",
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
                                Text("A MiindTiime Coach is available if you'd like support or have additional questions. Just click the Contact Me button below, and someone will reach out within 24 hours. We'll see you again tomorrow! Don't forget to set a reminder on your phone to keep your Journey going!"),
                                SizedBox(height: 10.w,),
                                TextButton(onPressed: (){}, child: Text("🌐 wwww.MiindTrack.com", style: TextStyle(color: Colors.white),)),
                                TextButton(onPressed: (){}, child: Text("📧 Email Us: miindtiime@gmail.com",style: TextStyle(color: Colors.white),)),
                                SizedBox(height: 10.w,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded( flex: 4 ,child: ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, ContactScreen.name);
                            },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff145dfc)
                                ),
                                child: Text("Contact Me"))),
                            SizedBox(width: 10.w),
                            Expanded(flex: 4 ,child: ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, SignInPage.name);
                            }, child: Text("Close"))),
                          ],
                        ),
                        SizedBox(height: 15.h)
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
