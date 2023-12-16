import 'package:flutter/material.dart';

import '../utils/colors.dart';


Text Custom_text(String text){
  return Text(text, style: TextStyle(fontFamily: "Roboto", fontSize: 20));
}

Text Table_Row_text(String text){
  return Text(text, style: TextStyle(fontFamily: "Roboto", fontSize: 16));
}

Text White_text(String text){
  return Text(
    text,
    style: TextStyle(
        color: ColorsCode.white_color, fontFamily: "Roboto", fontSize: 20),
  );
}

Text Drawer_text(String text){
  return Text(
    text,
    style: TextStyle(
        color: ColorsCode.white_color, fontFamily: "Roboto", fontSize: 16),
  );
}