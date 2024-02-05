import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class FacebookAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString userName = ''.obs;
  RxString userPhotoUrl = ''.obs;

  Future<UserCredential> handleFacebookSignIn() async {
    try {
      AccessToken? accessToken = await FacebookAuth.instance.login() as AccessToken;
      AuthCredential credential = FacebookAuthProvider.credential(accessToken!.token);

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Access user information
      userName.value = userCredential.user?.displayName ?? "No Name";
      userPhotoUrl.value = userCredential.user?.photoURL ?? "";

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
