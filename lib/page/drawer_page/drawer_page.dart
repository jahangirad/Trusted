import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../mathod/google_signin_mathod.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../widgets/custom_text.dart';

class Drawer_Page extends StatefulWidget {
  Drawer_Page({super.key});

  @override
  State<Drawer_Page> createState() => _Drawer_PageState();
}

class _Drawer_PageState extends State<Drawer_Page> {

  GoogleAuthController gmail_control = Get.put(GoogleAuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: ColorsCode.black_color,
          child: Column(
            children: [
              Height_Width.height_distan_size20,
              Obx(() => CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  gmail_control.userPhotoUrl.value.toString(),
                ),
              )),
              Height_Width.height_distan_size15,
              Obx(() => White_text(
                "Hi, ${gmail_control.userName.value.toString()}",
              )),
              Height_Width.height_distan_size2,
              Divider(
                height: 3,
                color: ColorsCode.white_color,
              ),
              Height_Width.height_distan_size10,
              ListTile(
                onTap: (){
                  Get.toNamed('P2P_Create_Page');
                },
                title: White_text("P2P"),
                leading: Image.asset(Images.p2p, height: 30, width: 30,),
              ),
              Height_Width.height_distan_size5,
              ListTile(
                onTap: (){
                  Get.toNamed('M2M_Page');
                },
                title: White_text("Mobile Banking"),
                leading: Image.asset(Images.mbtomb, height: 30, width: 30,),
              ),
              Height_Width.height_distan_size5,
              ListTile(
                onTap: (){
                  Get.toNamed('Buy_Sell');
                },
                title: White_text("Buy and Sell"),
                leading: Image.asset(Images.buysell, height: 30, width: 30,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
