import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressCard extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final int currentDays;
  final int totalDays;

  const ProgressCard({
    super.key,
    required this.progress,
    required this.currentDays,
    required this.totalDays,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ), // card background
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  "Your Progress",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Overall Completion",  style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                )),
                Text(
                  "$currentDays / $totalDays days",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8.h,
                backgroundColor: Colors.white.withAlpha(50),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
