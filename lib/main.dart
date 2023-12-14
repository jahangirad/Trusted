import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      },
    );
  }
}
