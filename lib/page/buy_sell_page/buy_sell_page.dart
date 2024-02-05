import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';
import '../../utils/colors.dart';
import '../../utils/height_width_space.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/floating_Action_Button.dart';
import '../drawer_page/drawer_page.dart';

class Buy_Sell extends StatelessWidget {
  Buy_Sell({super.key});

  final GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Floating_Action_Button(),
      key: _drawer,
      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,
        title: White_text("Buy and Sell"),
        leading: IconButton(onPressed: (){
          _drawer.currentState!.openDrawer();
        }, icon: Icon(Icons.menu, size: 20,color: ColorsCode.white_color,)),
        centerTitle: true,
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
                Conditon_text("১. বাই-সেল করতে।"),
                Conditon_text("২. আপনাকে সাপোর্ট টিমের সাথে কথা বলতে হবে।"),
                Conditon_text("৩. সাপোর্ট টিমের নির্দেশনা অনুযায়ী কাজ করবেন।"),
                Height_Width.height_distan_size10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
