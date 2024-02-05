import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late RxString userName = ''.obs;
  late RxString userPhotoUrl = ''.obs;
  final box = GetStorage();


  Future<UserCredential> handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Access user information
      // userName.value = userCredential.user?.displayName ?? "No Name";
      // userPhotoUrl.value = userCredential.user?.photoURL ?? "";
      box.write("userName", userCredential.user?.displayName ?? "No Name");
      box.write("userPhotoUrl", userCredential.user?.photoURL ?? "");
      userPhotoUrl = box.read("userPhotoUrl");
      userName = box.read("userName");
      print(box.read("userPhotoUrl"));
      print(box.read("userName"));

      return userCredential;
    } catch (error) {
      return Future.error(error.toString());
    }
  }
  void navigateToHomeScreen(BuildContext context) {
    Get.toNamed('Home_Page');
  }
}
