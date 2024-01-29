import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import 'firebase_options.dart';
import 'page/buy_sell_page/buy_sell_page.dart';
import 'page/drawer_page/drawer_page.dart';
import 'page/home_page/home_page.dart';
import 'page/login_page/login.dart';
import 'page/m2m_page/m2m_page.dart';
import 'page/p2p_page/p2p_create_page.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ZIMKit().init(
    appID: 863657003, // your appid
    appSign: 'a3cc9581b8c73c40526fc4aa01457c35d5d8d6d2d35eefbd195ad5647ce56299', // your appSign
  );
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
        'P2P_Create_Page': (context) => P2P_Create_Page(),
        'Buy_Sell': (context) => Buy_Sell(),
        'M2M_Page': (context) => M2M_Page(),
      },
    );
  }
}
