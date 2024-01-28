import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_divider/text_divider.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/uid_create_and_button.dart';
import '../drawer_page/drawer_page.dart';

class P2P_Create_Page extends StatefulWidget {
  P2P_Create_Page({super.key});

  @override
  State<P2P_Create_Page> createState() => _P2P_Create_PageState();
}

class _P2P_Create_PageState extends State<P2P_Create_Page> {
  final GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawer,
      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,
        title: White_text("P2P"),
        leading: IconButton(onPressed: (){
          _drawer.currentState!.openDrawer();
        }, icon: Icon(Icons.menu, size: 20,color: ColorsCode.white_color,)),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.add_circle_outline_rounded, size: 20, color: ColorsCode.white_color,),
              itemBuilder: (context){
            return [
              PopupMenuItem(
                value: "Join Chat",
                  child: ListTile(
                    title: Join_text("Join Chat"),
                  ),
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return SingleChildScrollView(
                      child: AlertDialog(
                        content: Container(
                          height: Get.height / 2.5,
                          width: Get.width / 2,
                          child: UID_Create(),
                        )
                      ),
                    );
                  });
                },
              )
            ];
          })
        ],
      ),
      drawer: Drawer_Page(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Height_Width.height_distan_size20,
                TextDivider.horizontal(
                  text: const Text('মনোযোগ সহকারে পড়ুন', style: TextStyle(fontFamily: "Roboto", fontSize: 20),),
                  color: Colors.black45,
                  thickness: 3.0,
                ),
                Height_Width.height_distan_size10,
                Conditon_text("১. নিচের ফাঁকা ঘরে ৪-৫ টি সংখ্যা বসাবেন।"),
                Conditon_text("২. আপনার দেওয়া সংখ্যাগুলো বিপরীত পক্ষকে পাঠাবেন।"),
                Conditon_text("৩. বিপরীত পক্ষকে অ্যাপটি ইন্সটল করতে হবে।"),
                Conditon_text("৪. বিপরীত পক্ষ উপরের (+) ক্লিক করে। সংখ্যাগুলো ব্যবহার করে আপনার সাথে কথা বলতে পারবে।"),
                Conditon_text("[বিঃদ্রঃ আমাদের দেওয়া অ্যাকাউন্টের মাধ্যমে লেনদেন করবেন। অন্যথায় কর্তিপক্ষ দায়ি না।]"),
                Height_Width.height_distan_size10,
                UID_Create()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
