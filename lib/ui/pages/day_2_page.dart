import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/assets_paths.dart';
import 'habit_tracking_form.dart';

class Day2_Page extends StatefulWidget {
  const Day2_Page({super.key});
  static const String name = '/day-2';

  @override
  State<Day2_Page> createState() => _Day2_PageState();
}

class _Day2_PageState extends State<Day2_Page> {
  String selectedDay = "Day-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            heightFactor: .99,
            widthFactor: .94,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(20),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.white.withAlpha(20)),
                    ),
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.logoImg, height: 100.h, width: 100.w,),

                        Text(
                          "Day 2 - Who Is Jesus, Really?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h),

                        Text(
                          "Daily Scripture & Application",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ListTile(
                          leading: Icon(Icons.menu_book_outlined, color: Colors.blueAccent,),
                          title: Text("Devotional Text", style: TextStyle(color: Colors.white),),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Jesus is not just a moral guide, a wise teacher, or a name in a history book. He is the eternal Son of God who came into this world fully God and fully human. In Him we see the Father’s love, holiness, and mercy on display. He lived without sin, revealed the kingdom through miracles, and laid down His life on the cross to bear the weight of our sin. His resurrection was not only proof of His victory over death but the doorway into new life for us. To know Jesus is to see Him as Savior who forgives and as Lord who reigns. He is alive now, seated at the right hand of the Father, and present with His people through the Spirit.\n\n"
                              "Faith in Jesus is not passive belief but a daily way of life. He calls us to walk with Him closely, to reorder our days around His presence, and to let His truth shape our thoughts, choices, and desires. This happens through prayer that is honest, Scripture that we chew on and carry with us, silence where we learn to listen, and obedience that shows we trust Him. Real discipleship is not about fitting Jesus into the margins of life but centering life on Him. In every moment He invites us to know Him, to rest in His peace, and to live with His strength and joy as we learn to walk in the way He walked.",
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.lightbulb_outline, color: Colors.yellow),
                            SizedBox(width: 6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Scripture\nInsight",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded( // Wrap the Text widget in Expanded
                              child: Text(
                                "“We must allow the Word of God to confront us, to disturb our security, "
                                    "to undermine our complacency and to overthrow our patterns of thought and behavior.” "
                                    "— John Stott",
                                style: TextStyle(color: Colors.white70),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "John 14:6 (ESV):\nJesus said to him, ‘I am the way, and the truth, and the life. No one comes to the Father except through me.\n"
                            "Jesus is not one option among many—He is the only way to God."
                            ),
                          ),
                        ),
                       // SizedBox(height: 5.h),
                        ListTile(
                          leading: Icon(Icons.sports_volleyball_outlined, color: Colors.green,),
                          title: Text("Application", style: TextStyle(color: Colors.white),),
                        ),
                      //  SizedBox(height: 5.h),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "Knowing Jesus requires personal trust, not just information. To confess Him as Lord is to surrender your identity, future, and will to Him. Every day is an invitation to draw near to Jesus, to learn from Him, and to live by His Word.",
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "💡 Read John 1:1–18. Record one new truth about who Jesus is in the Action Step section.",
                                style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_outlined, size: 16.sp),
                                label: Text(
                                  "Back",
                                  style: TextStyle(fontSize: 12.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              IconButton(onPressed: (){}, icon: Icon(Icons.login_rounded, color: Colors.white,)),

                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, HabitTrackingForm.name);
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                                icon: Icon(Icons.calendar_month_outlined, size: 16.sp),
                                label: Text(
                                  "Start Tracking",
                                  style: TextStyle(fontSize: 12.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: 15,),
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
