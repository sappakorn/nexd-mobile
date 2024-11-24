import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/firebase_options.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:fluttertest/screen_widget/home_screen/home.dart';
import 'package:fluttertest/splash_screen.dart';
import 'package:get/get.dart';

import 'bindings/auth_binding.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black12),
      initialRoute: '/',
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginWidget()),
        GetPage(name: '/home', page: () => HomePage()),
      ],

      //HomePageTest()
    );
  }
}
