import 'package:flutter/material.dart';
import 'package:mind_time/ui/pages/sign_in_page.dart';
import 'package:mind_time/utils/assets_paths.dart';

import '../../controllers/auth_controller.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 3));
    bool isLoggedIn = await AuthController.isUserLoggedIn();
    if(isLoggedIn){
      Navigator.pushReplacementNamed(context, HomePage.name);
    }else{
      Navigator.pushReplacementNamed(context, SignInPage.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
            alignment: Alignment.center,
            child: Image.asset(AssetsPath.logoImg)),
      );

  }
}