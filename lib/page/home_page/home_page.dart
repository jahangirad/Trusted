import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_divider/text_divider.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_text.dart';
import '../drawer_page/drawer_page.dart';

class Home_Page extends StatelessWidget {
  Home_Page({super.key});

  final GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawer,
        appBar: AppBar(
          backgroundColor: ColorsCode.primary_color,
          title: White_text("Trusted"),
          leading: IconButton(onPressed: (){
            _drawer.currentState!.openDrawer();
          }, icon: Icon(Icons.menu, size: 20,color: ColorsCode.white_color,)),
          centerTitle: true,
        ),
        drawer: Drawer_Page(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Height_Width.height_distan_size20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: Get.height / 18,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          color: ColorsCode.red_color,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(child: White_text("Buy"))
                  ),
                  Container(
                      height: Get.height / 18,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          color: ColorsCode.red_color,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(child: White_text("Sell"))
                  ),
                  Container(
                      height: Get.height / 18,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          color: ColorsCode.primary_color,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(child: White_text("P2P"))
                  ),
                ],
              ),
              Height_Width.height_distan_size20,
              TextDivider.horizontal(
                text: const Text('Today Rate', style: TextStyle(fontFamily: "Roboto", fontSize: 15),),
                color: Colors.black45,
                thickness: 3.0,
              ),
              Height_Width.height_distan_size20,
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      Center(child: Custom_text("Name")),
                      Center(child: Custom_text("Buy")),
                      Center(child: Custom_text("Sell")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Perfect\nMoney")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Tether TRC20\nUSDT")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nUSDT")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nBTC")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nFDUSD")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nTUSD")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nBNB")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nETH")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nDOGE")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Table_Row_text("Binance\nDAI")),
                      Center(child: Table_Row_text("10 BDT")),
                      Center(child: Table_Row_text("20 BDT")),
                    ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
