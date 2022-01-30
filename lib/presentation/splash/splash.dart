import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store/presentation/resources/assets_manager.dart';
import 'package:store/presentation/resources/color_manager.dart';
import 'package:store/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
Timer? _timer;
_startDelay(){
  _timer=Timer(const Duration(seconds: 2),_goNext);
}
_goNext(){
Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
}
@override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: const Center(
          child:  Image(
            image: AssetImage(ImageAssets.splashLogo),
          ),
        ));
  }
}
