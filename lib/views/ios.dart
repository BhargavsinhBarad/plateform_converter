import 'package:flutter/cupertino.dart';
import 'package:plateform_converter/views/Tabs/add.dart';
import 'package:provider/provider.dart';

import '../provider/platefrom.dart';
import 'Tabs/call.dart';
import 'Tabs/chat.dart';
import 'Tabs/setting.dart';

class ios extends StatelessWidget {
  ios({Key? key}) : super(key: key);

  List<Widget> tab = [
    const add_contact(),
    const chat(),
    const call(),
    const setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: "add"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: "chat"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: "call"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "settings"),
        ],
      ),
      tabBuilder: (context, index) => tab[index],
    );
  }
}
