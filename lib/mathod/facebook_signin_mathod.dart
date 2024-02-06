import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FacebookAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late RxString userName = ''.obs;
  late RxString userPhotoUrl = ''.obs;
  final box = GetStorage();

  Future<UserCredential> handleFacebookSignIn() async {
    try {
      AccessToken? accessToken = await FacebookAuth.instance.login() as AccessToken;
      AuthCredential credential = FacebookAuthProvider.credential(accessToken!.token);

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Access user information
      box.write("userName", userCredential.user?.displayName ?? "No Name");
      box.write("userPhotoUrl", userCredential.user?.photoURL ?? "");
      print(box.read("userPhotoUrl"));
      print(box.read("userName"));

      return userCredential;
    } catch (error) {
      print(error);
      return Future.error(error.toString());
    }
  }
  void navigateToHomeScreen(BuildContext context) {
    Get.toNamed('Home_Page');
  }
}
