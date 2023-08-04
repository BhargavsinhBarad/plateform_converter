import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/Theme_provider.dart';
import '../../provider/profile.dart';
import '../../utils/Global.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                    value: Provider.of<switchprovider>(context, listen: true)
                        .isprofile,
                    onChanged: (val) {
                      Provider.of<switchprovider>(context, listen: false)
                          .changeprofile(val);
                    }),
              ],
            ),
          ),
          (Provider.of<switchprovider>(context, listen: true).isprofile == true)
              ? Column(
                  children: [
                    if (Global.pic == null)
                      CircleAvatar(
                        radius: 55,
                        child: Icon(CupertinoIcons.camera),
                      )
                    else
                      CircleAvatar(
                        radius: 55,
                        foregroundImage: FileImage(File(Global.pic!.path)),
                      ),
                    const SizedBox(height: 10),
                    CupertinoButton(
                      onPressed: () async {
                        final XFile? image = await Global.picker
                            .pickImage(source: ImageSource.camera);
                        setState(() {
                          Global.pic = image;
                        });
                      },
                      child: const Icon(
                        CupertinoIcons.camera,
                      ),
                    ),
                    CupertinoTextFormFieldRow(
                      controller: Global.PNameController,
                      onSaved: (val) {
                        Global.Pname = val!;
                      },
                    ),
                    CupertinoTextFormFieldRow(
                      controller: Global.BioController,
                      onSaved: (val) {
                        Global.Bio = val!;
                      },
                    ),
                  ],
                )
              : Container(),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                    value: Provider.of<themeprovider>(context, listen: true)
                        .theme
                        .isdark,
                    onChanged: (val) {
                      Provider.of<themeprovider>(context, listen: false)
                          .changetheme(val);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
