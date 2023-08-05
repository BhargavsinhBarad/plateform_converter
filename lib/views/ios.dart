import 'package:flutter/cupertino.dart';
import 'package:plateform_converter/views/Tabs/add.dart';
import 'package:provider/provider.dart';

import '../provider/platefrom.dart';
import 'Tabs/call.dart';
import 'Tabs/chat.dart';
import 'Tabs/setting.dart';

class ios extends StatefulWidget {
  const ios({Key? key}) : super(key: key);

  @override
  State<ios> createState() => _iosState();
}

class _iosState extends State<ios> {
  List<Widget> tab = [
    add_contact(),
    chat(),
    call(),
    setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
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
