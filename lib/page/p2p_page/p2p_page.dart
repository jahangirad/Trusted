import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/floating_Action_Button.dart';
import '../drawer_page/drawer_page.dart';

class ZIMKitDemoHomePage extends StatelessWidget {
  ZIMKitDemoHomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Floating_Action_Button(),
      key: _drawer,
      drawer: Drawer_Page(),
      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,
        title: White_text("Chat"),
        leading: IconButton(onPressed: (){
          _drawer.currentState!.openDrawer();
        }, icon: Icon(Icons.menu, size: 20,color: ColorsCode.white_color,)),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.add_circle_outline_rounded, size: 20, color: ColorsCode.white_color,),
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                    value: "Join Chat",
                    child: ListTile(
                      title: Join_text("Join Chat"),
                    ),
                    onTap: (){
                      ZIMKit().showDefaultNewPeerChatDialog(context);
                    },
                  )
                ];
              })
        ],
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ZIMKitMessageListPage(
                conversationID: conversation.id,
                conversationType: conversation.type,
              );
            },
          ));
        },
      ),
    );
  }
}