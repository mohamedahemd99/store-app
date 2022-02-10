import 'package:flutter/material.dart';
import 'package:store/app/di.dart';
import 'package:store/presentation/resources/routes_manager.dart';
import 'package:store/presentation/resources/theme_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:getAppTheme(),
     onGenerateRoute:RouteGenerator.getRoute ,
      initialRoute: Routes.splashRoute,
    );
  }
}
