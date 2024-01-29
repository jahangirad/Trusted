import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

FloatingActionButton Floating_Action_Button(){
  final Uri _url = Uri.parse('https://wa.link/il6e8u');
  return FloatingActionButton(
      child: Image.asset("assets/image/support.png"),
      onPressed: ()async{
        if(!await launchUrl(_url)){
          throw Exception('Could not launch $_url');
        }
      }
  );
}