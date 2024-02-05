import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../mathod/facebook_signin_mathod.dart';
import '../../mathod/google_signin_mathod.dart';
import '../../utils/colors.dart';
import 'package:text_divider/text_divider.dart';
import '../../utils/images.dart';

class Login_Page extends StatelessWidget {
  Login_Page({super.key});

  GoogleAuthController control_gmail = Get.put(GoogleAuthController());
  FacebookAuthController control_fb = Get.put(FacebookAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                    height: Get.height / 3,
                    width: Get.width,
                    child: Lottie.asset("assets/animation/Login Lottifile.json")),
                Height_Width.height_distan_size15,
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.primary_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.primary_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: ColorsCode.primary_color,
                    ),
                    hintText: "E-mail or Phone",
                    hintStyle: TextStyle(color: ColorsCode.primary_color),
                    labelText: "User",
                    labelStyle: TextStyle(color: ColorsCode.primary_color),
                  ),
                ),
                Height_Width.height_distan_size10,
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.primary_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.primary_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorsCode.primary_color,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: ColorsCode.primary_color),
                    labelText: "Password",
                    labelStyle: TextStyle(color: ColorsCode.primary_color),
                  ),
                ),
                Height_Width.height_distan_size15,
                GestureDetector(
                  onTap: (){
                    FirebaseAuth.instance.authStateChanges().listen((User? user) {
                      if (user != null) {
                        Get.offNamed('Home_Page');
                      }
                    });
                  },
                  child: Container(
                    height: Get.height / 14,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: ColorsCode.primary_color,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: ColorsCode.white_color, fontFamily: "Roboto", fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Height_Width.height_distan_size20,
                TextDivider.horizontal(
                  text: const Text('Or Sign up with', style: TextStyle(fontFamily: "Roboto", fontSize: 15),),
                  color: Colors.black45,
                  thickness: 3.0,
                ),
                Height_Width.height_distan_size20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                          control_gmail.handleSignIn();
                      },
                      child: Container(
                        height: Get.height / 18,
                        width: Get.width / 2.5,
                        decoration: BoxDecoration(
                            color: ColorsCode.primary_color,
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Image.asset(Images.signup_google, scale: 2,),
                            ),
                            Height_Width.width_distan_size5,
                            Text("Google", style: TextStyle(color: ColorsCode.white_color, fontFamily: "Roboto", fontSize: 16),)
                          ],
                        )
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                          control_fb.handleFacebookSignIn();
                      },
                      child: Container(
                          height: Get.height / 18,
                          width: Get.width / 2.5,
                          decoration: BoxDecoration(
                              color: ColorsCode.primary_color,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(Images.signup_fb,),
                              ),
                              Height_Width.width_distan_size5,
                              Text("Facebook", style: TextStyle(color: ColorsCode.white_color, fontFamily: "Roboto", fontSize: 16),)
                            ],
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
