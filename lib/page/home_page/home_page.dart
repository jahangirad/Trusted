import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_divider/text_divider.dart';
import 'package:trusted/utils/height_width_space.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/floating_Action_Button.dart';
import '../buy_sell_page/buy_sell_page.dart';
import '../drawer_page/drawer_page.dart';
import '../m2m_page/m2m_page.dart';
import '../p2p_page/p2p_create_page.dart';

class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();

  var active_index = 0;

  final List<String> imgList = [
    'assets/image/Buy Sell slider.png',
    'assets/image/Mobile to Mobile slider.png',
    'assets/image/p2p slider.png',
  ];

  final List pages = [
    Buy_Sell(), M2M_Page(), P2P_Create_Page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Floating_Action_Button(),
      key: _drawer,
      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,
        title: White_text("Trusted"),
        leading: IconButton(
            onPressed: () {
              _drawer.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 20,
              color: ColorsCode.white_color,
            )),
        centerTitle: true,
      ),
      drawer: Drawer_Page(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //CarouselSlider is a package
              child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                    if(imgList.length == null || imgList.isEmpty){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[itemIndex]));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(imgList[itemIndex]),
                                  fit: BoxFit.fill
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                        ),
                      );
                    }
                  },
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    onPageChanged: (index, etc){
                      setState(() {
                        active_index = index;
                      });
                    }
                  )
              ),
            ),
            Height_Width.height_distan_size20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('Buy_Sell');
                  },
                  child: Container(
                      height: Get.height / 18,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          color: ColorsCode.primary_color,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(child: White_text("Buy/Sell"))),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('M2M_Page');
                  },
                  child: Container(
                      height: Get.height / 18,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          color: ColorsCode.primary_color,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(child: White_text("MB = MB"))),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('P2P_Create_Page');
                  },
                  child: Container(
                      height: Get.height / 18,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          color: ColorsCode.primary_color,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12))),
                      child: Center(child: White_text("P2P"))),
                ),
              ],
            ),
            Height_Width.height_distan_size20,
            //Text Divider is a package
            TextDivider.horizontal(
              text: const Text(
                'মনোযোগ সহকারে পড়ুন',
                style: TextStyle(fontFamily: "Roboto", fontSize: 15),
              ),
              color: Colors.black45,
              thickness: 3.0,
            ),
            Height_Width.height_distan_size20,
            Conditon_text("১. বাই-সেল অপশনে কারেন্সি বাই-সেল করতে পাবেন।"),
            Conditon_text(
                "২. এমবি = এমবি অপশনে যে কোন মোবাইল ব্যাংকিং এর টাকা যে কোন মোবাইল ব্যাংকিং এ নিতে পারবেন। যেমন: বিকাশ, নগদ, রকেট ইত্যাদি।"),
            Conditon_text(
                "৩. পিটুপি অপশন অপরিচিত ব্যাক্তির সাথে লেনদেন করার জন্য ব্যবহার করবেন।"),
            Conditon_text("বিঃদ্রঃ সকল প্রকার কারেন্সি বাই-সেল করা হয়।"),
          ],
        ),
      ),
    );
  }
}
