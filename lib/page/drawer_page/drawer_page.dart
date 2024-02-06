import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../mathod/facebook_signin_mathod.dart';
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
  FacebookAuthController fb_control = Get.put(FacebookAuthController());
  late String gmailUserName;
  late String gmailUserPhotoUrl;
  late String fbUserName;
  late String fbUserPhotoUrl;

  Future datastore()async{
    setState(() {
      gmailUserPhotoUrl = gmail_control.box.read("userPhotoUrl");
      gmailUserName = gmail_control.box.read("userName");
      fbUserPhotoUrl = fb_control.box.read("userPhotoUrl");
      fbUserName = fb_control.box.read("userName");
    });
  }

  @override
  void initState() {
    datastore();
    super.initState();
  }


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
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    gmailUserPhotoUrl.isEmpty ? fbUserPhotoUrl.toString() : gmailUserPhotoUrl.toString()
                ),
              ),
              Height_Width.height_distan_size15,
              White_text(
                "Hi, ${
                    gmailUserName.isEmpty ? fbUserName.toString() : gmailUserName.toString()
                }",
              ),
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
