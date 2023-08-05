import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/contact_provider.dart';
import '../../provider/date_time.dart';
import '../../provider/platefrom.dart';
import '../../utils/Global.dart';

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Platefrom Converter"),
        trailing: CupertinoSwitch(
          value: Provider.of<platfrom>(context, listen: false).isios,
          onChanged: (val) {
            Provider.of<platfrom>(context, listen: false).changeolatfrom(val);
          },
        ),
      ),
      child: (ContactProvider.allContacts.isNotEmpty)
          ? ListView.builder(
              itemCount: ContactProvider.allContacts.length,
              itemBuilder: (context, index) {
                return Material(
                  child: ListTile(
                    title: Text(
                      "${ContactProvider.allContacts[index].Name}",
                    ),
                    subtitle: Text(
                        "${ContactProvider.allContacts[index].MobileNumber}"),
                    leading: Material(
                      child: CircleAvatar(
                        radius: 25,
                        foregroundImage: FileImage(File(Global.pic!.path)),
                      ),
                    ),
                    trailing: Text(
                        "${Provider.of<DateProvider>(context).d1.Date.day}/${Provider.of<DateProvider>(context).d1.Date.month}/${Provider.of<DateProvider>(context).d1.Date.year},${Provider.of<DateProvider>(context).t1.time.hour}:${Provider.of<DateProvider>(context).t1.time.minute}"),
                  ),
                );
              },
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Contacts ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }
}
