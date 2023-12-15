import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page/drawer_page/drawer_page.dart';
import 'page/home_page/home_page.dart';
import 'page/login_page/login.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trusted",
      initialRoute: "Login_Page",
      routes: {
        'Login_Page': (context) => const Login_Page(),
        'Home_Page': (context) => Home_Page(),
        'Drawer_Page': (context) => Drawer_Page(),
      },
    );
  }
}
