import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'ui/pages/contact_screen.dart';
import 'ui/pages/day_2_page.dart';
import 'ui/pages/forgot_password_screen.dart';
import 'ui/pages/habit_tracking_form.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/profile_update_page.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/sign_up_screen.dart';
import 'ui/pages/task_completion_save_congratulation_screen.dart';
import 'ui/widgets/gradient_bg.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static  GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleWH: () => true,
      enableScaleText: () => true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, __) {
        return GetMaterialApp(
          navigatorKey: MyApp.navigator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,

            cardTheme: CardThemeData(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
                side: const BorderSide(
                  color: Colors.white24,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              elevation: 0,
            ),

            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
              titleLarge: TextStyle(color: Colors.white),
              titleMedium: TextStyle(color: Colors.white),
              titleSmall: TextStyle(color: Colors.white),
            ),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white24,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),),

            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white12,
              filled: true,
              hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: Colors.white24),),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: Colors.white24),),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: Colors.white24),),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: Colors.white24),),
            ),
          ),


          home: GradientScaffold(child: SignInPage()),
          initialRoute: SignInPage.name,
          routes: {
            SignInPage.name: (context) => GradientScaffold(child: SignInPage()),
            SignUpPage.name: (context) => GradientScaffold(child: SignUpPage()),
            ForgotPassPage.name: (context) => const GradientScaffold(child: ForgotPassPage()),
            HomePage.name: (context) => const GradientScaffold(child: HomePage()),
            Day2_Page.name: (context) => const GradientScaffold(child: Day2_Page()),
            HabitTrackingForm.name: (context) => const GradientScaffold(child: HabitTrackingForm()),
            Profile_Update_Page.name: (context) => GradientScaffold(child: Profile_Update_Page()),
            TaskCompletionSaveCongratulationScreen.name: (context) => GradientScaffold(child: TaskCompletionSaveCongratulationScreen()),
            ContactScreen.name: (context) => GradientScaffold(child: ContactScreen()),
          },
        );
      },
    );
  }
}





