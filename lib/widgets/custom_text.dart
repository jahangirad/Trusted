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


Text Join_text(String text){
  return Text(text, style: TextStyle(color: ColorsCode.primary_color, fontSize: 20),);
}

Text Conditon_text(String text){
  return Text(text, style: TextStyle(color: ColorsCode.black_color, fontSize: 15),);
}