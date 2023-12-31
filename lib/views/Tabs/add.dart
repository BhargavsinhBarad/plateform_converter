// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/platefrom.dart';
import '../../utils/Global.dart';

class add_contact extends StatefulWidget {
  const add_contact({Key? key}) : super(key: key);

  @override
  State<add_contact> createState() => _add_contactState();
}

class _add_contactState extends State<add_contact> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Platefrom Converter"),
        trailing: CupertinoSwitch(
          value: Provider.of<platfrom>(context, listen: false).isios,
          onChanged: (val) {
            Provider.of<platfrom>(context, listen: false).changeolatfrom(val);
          },
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          if (Global.pic == null)
            const Center(
              child: CircleAvatar(
                radius: 65,
                child: Icon(CupertinoIcons.camera),
              ),
            )
          else
            Center(
              child: CircleAvatar(
                radius: 65,
                foregroundImage: FileImage(File(Global.pic!.path)),
              ),
            ),
          CupertinoButton(
            onPressed: () async {
              final XFile? image =
                  await Global.picker.pickImage(source: ImageSource.camera);
              setState(() {
                Global.pic = image;
              });
            },
            child: const Icon(
              CupertinoIcons.camera,
            ),
          ),
        ],
      ),
    );
  }
}
