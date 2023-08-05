import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/contact_provider.dart';
import '../../provider/platefrom.dart';
import '../../utils/Global.dart';

class call extends StatefulWidget {
  const call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
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
                      trailing: CupertinoButton(
                        onPressed: () async {
                          launchUrl(
                            Uri(
                                scheme: 'tel',
                                path:
                                    "${ContactProvider.allContacts[index].MobileNumber}"),
                          );
                        },
                        child: Icon(CupertinoIcons.phone),
                      ),
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
              ));
    ;
  }
}
