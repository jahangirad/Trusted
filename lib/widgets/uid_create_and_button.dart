import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../page/p2p_page/p2p_page.dart';
import '../utils/colors.dart';
import '../utils/height_width_space.dart';
import 'custom_text.dart';

class UID_Create extends StatefulWidget {
  const UID_Create({super.key});

  @override
  State<UID_Create> createState() => _UID_CreateState();
}

class _UID_CreateState extends State<UID_Create> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController userID = TextEditingController();
  TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Join_text("Join Chat"),
        Height_Width.height_distan_size10,
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: userID,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsCode.primary_color),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsCode.primary_color),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: ColorsCode.primary_color,
                  ),
                  hintText: "UID",
                  labelText: "UID",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'UID Please';
                  }
                  return null;
                },
              ),
              Height_Width.height_distan_size5,
              TextFormField(
                controller: userName,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsCode.primary_color),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsCode.primary_color),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: ColorsCode.primary_color,
                  ),
                  hintText: "Username",
                  labelText: "Username",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username Please';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        Height_Width.height_distan_size10,
        GestureDetector(
          onTap: ()async{
            if (_formKey.currentState!.validate()) {
              await ZIMKit()
                  .connectUser(id: userID.text, name: userName.text);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                  ZIMKitDemoHomePage(),
                ),
              );
            }
          },
          child: Container(
            height: Get.height / 14,
            width: Get.width,
            decoration: BoxDecoration(
              color: ColorsCode.primary_color,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(child: White_text("Continue")),
          ),
        )
      ],
    );
  }
}
