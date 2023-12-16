import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_text.dart';

class Drawer_Page extends StatelessWidget {
  const Drawer_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: Get.height,
        width: Get.width,
        color: ColorsCode.black_color,
        child: Column(
          children: [
            Height_Width.height_distan_size20,
            Container(
              height: Get.height / 8,
              width: Get.width / 3.5,
              decoration: BoxDecoration(
                color: ColorsCode.red_color,
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Height_Width.height_distan_size15,
            White_text("Name"),
            Height_Width.height_distan_size2,
            Drawer_text("E-mail"),
            Height_Width.height_distan_size10,
            Divider(
              height: 3,
              color: ColorsCode.white_color,
            ),
            Height_Width.height_distan_size10,

          ],
        ),
      ),
    );
  }
}
