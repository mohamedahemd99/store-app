import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/presentation/forgot_password/forgot_password.dart';
import 'package:store/presentation/login/login.dart';
import 'package:store/presentation/main/main_view.dart';
import 'package:store/presentation/onBoarding/onBoarding.dart';
import 'package:store/presentation/register/register.dart';
import 'package:store/presentation/resources/strings_manager.dart';
import 'package:store/presentation/splash/splash.dart';
import 'package:store/presentation/store_details/store_details.dart';

class Routes{
  static const String splashRoute='/';
  static const String onBoardingRoute='/onBoarding';
  static const String loginRoute='/login';
  static const String registerRoute='/register';
  static const String forgotPasswordRoute='/forgotPassword';
  static const String mainRoute='/main';
  static const String storeDetailsRoute='/storeDetails';
}
class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),);
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => const MainViewScreen(),);
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),);
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterScreen(),);
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => const StoreDetailsScreen(),);
      default:
        return UnDefinedRoute();
    }
  }
  static Route<dynamic>UnDefinedRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(title:Text(AppStrings.noRouteFound) ,),
      body: Center(child: Text(AppStrings.noRouteFound),),
    ),);
  }
}