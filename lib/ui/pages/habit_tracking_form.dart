import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/assets_paths.dart';
import '../widgets/custom_from_field.dart';
import 'task_completion_save_congratulation_screen.dart';

class HabitTrackingForm extends StatefulWidget {
  const HabitTrackingForm({super.key});
  static const String name = '/HabitTrackingForm';

  @override
  State<HabitTrackingForm> createState() => _HabitTrackingFormState();
}

class _HabitTrackingFormState extends State<HabitTrackingForm> {

  final TextEditingController _wakeUpTEcontroller = TextEditingController();
  final TextEditingController _bedTimeTEcontroller = TextEditingController();
  final TextEditingController _christLivesinTEcontroller = TextEditingController();
  final TextEditingController _freshStartTEcontroller = TextEditingController();
  final TextEditingController _dailyHabitsReflectTEcontroller = TextEditingController();
  final TextEditingController _prayerRequestTEcontroller = TextEditingController();

  // Generate time slots (30 min difference)
  final List<String> timeSlots = List.generate(
    48,
        (index) {
      final hour = index ~/ 2;
      final minute = (index % 2) * 30;
      final period = hour < 12 ? "AM" : "PM";
      final displayHour = (hour % 12 == 0) ? 12 : hour % 12;
      final displayMinute = minute.toString().padLeft(2, "0");
      return "$displayHour:$displayMinute $period";
    },
  );

  String? bedTime;
  String? wakeTime;

  Duration? getSleepDuration() {
    if (bedTime == null || wakeTime == null) return null;

    final bedIndex = timeSlots.indexOf(bedTime!);
    final wakeIndex = timeSlots.indexOf(wakeTime!);

    int diff = wakeIndex - bedIndex;
    if (diff <= 0) diff += 48; // handle crossing midnight

    return Duration(minutes: diff * 30);
  }


  final Map<String, bool> habits = {
    "Morning: Prayer": false,
    "Morning: Bible Reading": true,
    "Morning: Devotional Reading": true,
    "Evening: Prayer": true,
  };

  @override
  Widget build(BuildContext context) {

    final sleepDuration = getSleepDuration();
    String sleepText = sleepDuration == null
        ? "Select times to calculate sleep"
        : "${sleepDuration.inHours}h ${sleepDuration.inMinutes % 60}m";

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            heightFactor: .99,
            widthFactor: .94,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
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
                          "KOW FOUNDATION HABITS 1",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h),

                        Text(
                          "Today's Scripture Insight for Day 1",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Saved 9:45:46 PM",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 20.h),
                        Text(
                          "Saved 9:45:46 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text("Bedtime🌙 (Yesterday)"),
                             SizedBox(height: 10.h),

                            // Bedtime dropdown
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white12,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r),),
                              ),
                              dropdownColor: Color(0xFF0E2845),
                              iconEnabledColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 16),
                              initialValue: bedTime,
                              items: timeSlots.map((t) => DropdownMenuItem(
                                value: t,
                                child: Text(t, style: TextStyle(color: Colors.white)),
                              )).toList(),
                              onChanged: (val) {
                                setState(() {
                                  bedTime = val;
                                });
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text("Wakeup ☀️ time"),
                            SizedBox(height: 10.h),
                            // Wakeup dropdown
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white12,
                                border: OutlineInputBorder(),
                              ),
                              dropdownColor: Color(0xFF0E2845),
                              iconEnabledColor: Colors.white,
                              style: TextStyle(color: Colors.white, fontSize: 16),
                              initialValue: wakeTime,
                              items: timeSlots
                                  .map((t) => DropdownMenuItem(
                                value: t,
                                child: Text(t, style: TextStyle(color: Colors.white)),
                              ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  wakeTime = val;
                                });
                              },
                            ),
                            SizedBox(height: 30),

                            // Result text
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Total Sleep Time: $sleepText",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white10
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Daily Habits",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                   SizedBox(height: 10.w),
                                  ...habits.keys.map((habit) {
                                    return CheckboxListTile(
                                      value: habits[habit],
                                      onChanged: (val) {
                                        setState(() {
                                          habits[habit] = val ?? false;
                                        });
                                      },
                                      title: Text(
                                        habit,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      controlAffinity: ListTileControlAffinity.leading,
                                      activeColor: Colors.blueAccent,
                                      checkColor: Colors.white,
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                            ),

                            SizedBox(height: 10.h),
                            Text("Today's Self Reflections / Questions for my Coach", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 5),
                            Text("Reflection prompts:" , style: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500

                            ),),
                            const SizedBox(height: 5),
                            Text("What does it mean for you personally that “Christ lives in you?", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 5),
                            CustomTextForm(actionStepTEcontroller: _christLivesinTEcontroller, hintText: 'Enter your self reflections and questions',),
                            const SizedBox(height: 5),
                            Text("In what area of your life do you need to embrace a fresh start today?", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 5),
                            CustomTextForm(actionStepTEcontroller: _freshStartTEcontroller, hintText: 'Enter Your self reflections and questions',),
                            const SizedBox(height: 5),
                            Text("How can your daily habits reflect the reality of Christ’s life working through you?", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 5),
                            CustomTextForm(actionStepTEcontroller: _dailyHabitsReflectTEcontroller, hintText: 'Enter Your self reflections and questions',),
                            const SizedBox(height: 5),
                            Text("Today's Prayer Request", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 5),
                            CustomTextForm(actionStepTEcontroller: _prayerRequestTEcontroller, hintText: 'Enter your self reflections and questions',),
                          ],
                        ),

                        SizedBox(height: 20.h),
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
                                Navigator.pushNamed(context, TaskCompletionSaveCongratulationScreen.name);
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
                        SizedBox(height: 20.h),
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


