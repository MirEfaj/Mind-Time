import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_time/ui/pages/day_2_page.dart';
import '../../utils/assets_paths.dart';
import '../widgets/progress_card.dart';
import 'sign_in_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDay = "Day-1";

  final List<Map<String, String>> stats = const [
    {
      "title": "Days Completed",
      "value": "7",
      "icon": "check_circle",
      "color": "yellow",
    },
    {
      "title": "Current Streak",
      "value": "1",
      "icon": "calendar_today",
      "color": "white",
    },
    {
      "title": "Completion Rate",
      "value": "17.5%",
      "icon": "access_time",
      "color": "purple",
    },
    {
      "title": "Last Activity",
      "value": "1/9/2025",
      "icon": "whatshot",
      "color": "white",
    },
  ];

  IconData _getIcon(String name) {
    switch (name) {
      case "check_circle":
        return Icons.whatshot_outlined;
      case "calendar_today":
        return Icons.auto_graph_sharp;
      case "access_time":
        return Icons.check_circle_outline;
      case "whatshot":
        return Icons.access_time_outlined;
      default:
        return Icons.info;
    }
  }

  Color _getColor(String name) {
    switch (name) {
      case "yellow":
        return Colors.yellow;
      case "purple":
        return Colors.purple;
      default:
        return Colors.white;
    }
  }

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AssetsPath.logoImg, height: 100.h, width: 100.w,),

                        Text(
                          "Welcome Back, Mir Efaj",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h),

                        Text(
                          "Continue your daily habit tracking journey",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 20.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: stats.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 16 / 11,
                              ),
                          itemBuilder: (context, index) {
                            final item = stats[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    _getIcon(item["icon"]!),
                                    color: _getColor(item["color"]!),
                                  ),
                                  SizedBox(width: 8.h),
                                  Text(
                                    item["value"]!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Flexible(
                                    child: Text(
                                      item["title"]!,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                        ProgressCard(
                          progress: 0.0, // 0% completion
                          currentDays: 0,
                          totalDays: 40,
                        ),
                        SizedBox(height: 10.h),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 8.w),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recommended For Today",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        "Continue your journey with Day-1. You're making great progress!",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10.sp,
                                        ),
                                        softWrap: true,
                                        maxLines: null, // unlimited
                                      ),
                                      SizedBox(height: 8.h),
                                      Chip(
                                        label: Text(
                                          "Day-1",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        backgroundColor: Color(0xff5061a8),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                        labelPadding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.r),
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 1,
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

                        SizedBox(height: 10.h),
                        Text("Select Day"),
                        SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        initialValue: selectedDay,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white12
                        ),
                        dropdownColor: Color(0xFF0E2845),
                        iconEnabledColor: Colors.white, // dropdown arrow color
                        style: const TextStyle(color: Colors.white), // text color
                        items: List.generate(40,
                              (index) => DropdownMenuItem(
                            value: "Day-${index + 1}",
                            child: Text("Day-${index + 1}"),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedDay = value!;
                          });
                        },
                      ),
                    ),
                        SizedBox(height: 10.h),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Text("Begin with Day 1 or pick up where you left off. You can always return to review, edit, or add to your past responses."),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, SignInPage.name);
                            },
                            icon: const Icon(Icons.login_outlined, color: Colors.white),
                            label: const Text('LogOut',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              maximumSize: Size(double.infinity, 40),
                              backgroundColor:  Colors.white12,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // rounded corners
                              ),
                            ),
                          ),

                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, Day2_Page.name);
                            },
                            icon: const Icon(Icons.calendar_month_outlined, color: Colors.white),
                            label: const Text('Start Day',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              maximumSize: Size(double.infinity, 40),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // rounded corners
                              ),
                            ),
                          ),
                        ],
                        ),
                        SizedBox(height: 10.h),
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
