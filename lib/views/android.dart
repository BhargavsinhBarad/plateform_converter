import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plateform_converter/provider/date_time.dart';
import 'package:plateform_converter/provider/profile.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/contact_model.dart';
import '../provider/Theme_provider.dart';
import '../provider/contact_provider.dart';
import '../provider/platefrom.dart';
import '../utils/Global.dart';

class android extends StatefulWidget {
  const android({Key? key}) : super(key: key);

  @override
  State<android> createState() => _androidState();
}

class _androidState extends State<android> {
  PageController pageController = PageController();
  int inde = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platefrom Converter"),
        actions: [
          Switch(
            value: Provider.of<platfrom>(context, listen: false).isios,
            onChanged: (val) {
              Provider.of<platfrom>(context, listen: false).changeolatfrom(val);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: inde,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blue,
        showSelectedLabels: true,
        selectedItemColor: Colors.redAccent,
        onTap: (val) {
          setState(() {
            inde = val;
            pageController.animateToPage(inde,
                duration: Duration(microseconds: 300),
                curve: Curves.easeInOutBack);
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_rounded),
            label: "new",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Call",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
      body: Center(
        child: PageView(
          onPageChanged: (val) {
            setState(() {
              inde = val;
            });
          },
          controller: pageController,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  if (Global.pic == null)
                    const CircleAvatar(
                      radius: 65,
                      child: Icon(Icons.camera_alt),
                    )
                  else
                    CircleAvatar(
                      radius: 65,
                      foregroundImage: FileImage(File(Global.pic!.path)),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? image = await Global.picker
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        Global.pic = image;
                      });
                    },
                    child: const Icon(Icons.camera_alt_rounded),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Global.NameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.manage_accounts),
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (val) {
                      Global.Nmae = val!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: Global.PhoneController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Enter Your phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (val) {
                      Global.phone = val!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Global.ChatController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.chat),
                      hintText: "Chat Conversation",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (val) {
                      Global.chat = val!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? pickdate = await showDatePicker(
                        context: context,
                        initialDate:
                            Provider.of<DateProvider>(context, listen: false)
                                .d1
                                .Date,
                        firstDate: DateTime(2005),
                        lastDate: DateTime(2050),
                      );
                      Provider.of<DateProvider>(context, listen: false)
                          .pickDate(pickdate!);
                    },
                    child: Text("⌚ Pick a Date"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? picktime = await showTimePicker(
                        context: context,
                        initialTime:
                            Provider.of<DateProvider>(context, listen: false)
                                .t1
                                .time,
                      );
                      Provider.of<DateProvider>(context, listen: false)
                          .picktime(picktime!);
                    },
                    child: Text("⌚ Pick a TIme"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<ContactProvider>(context, listen: false)
                            .addContacts(
                          Contacts(
                            Chat: Global.ChatController.text,
                            Name: Global.NameController.text,
                            MobileNumber: Global.PhoneController.text,
                          ),
                        );
                      },
                      child: Text("Save"))
                ],
              ),
            ),
            (ContactProvider.allContacts.isNotEmpty)
                ? ListView.builder(
                    itemCount: ContactProvider.allContacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "${ContactProvider.allContacts[index].Name}",
                        ),
                        subtitle: Text(
                          "${ContactProvider.allContacts[index].MobileNumber}",
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          foregroundImage: FileImage(
                            File(Global.pic!.path),
                          ),
                        ),
                        trailing: Text(
                            "${Provider.of<DateProvider>(context).d1.Date.day}/${Provider.of<DateProvider>(context).d1.Date.month}/${Provider.of<DateProvider>(context).d1.Date.year},${Provider.of<DateProvider>(context).t1.time.hour}:${Provider.of<DateProvider>(context).t1.time.minute}"),
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
            (ContactProvider.allContacts.isNotEmpty)
                ? ListView.builder(
                    itemCount: ContactProvider.allContacts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'details',
                              arguments: ContactProvider.allContacts[index]);
                        },
                        child: ListTile(
                          title: Text(
                            "${ContactProvider.allContacts[index].Name}",
                          ),
                          subtitle: Text(
                              "${ContactProvider.allContacts[index].MobileNumber}"),
                          leading: CircleAvatar(
                            radius: 25,
                            foregroundImage: FileImage(File(Global.pic!.path)),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              launchUrl(
                                Uri(
                                    scheme: 'tel',
                                    path:
                                        "${ContactProvider.allContacts[index].MobileNumber}"),
                              );
                            },
                            icon: const Icon(Icons.phone),
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
                  ),
            Column(
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
                      Switch(
                          value:
                              Provider.of<switchprovider>(context, listen: true)
                                  .isprofile,
                          onChanged: (val) {
                            Provider.of<switchprovider>(context, listen: false)
                                .changeprofile(val);
                          }),
                    ],
                  ),
                ),
                (Provider.of<switchprovider>(context, listen: true).isprofile ==
                        true)
                    ? Column(
                        children: [
                          if (Global.pic == null)
                            const CircleAvatar(
                              radius: 55,
                              child: Icon(Icons.camera_alt),
                            )
                          else
                            CircleAvatar(
                              radius: 55,
                              foregroundImage:
                                  FileImage(File(Global.pic!.path)),
                            ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              final XFile? image = await Global.picker
                                  .pickImage(source: ImageSource.camera);
                              setState(() {
                                Global.pic = image;
                              });
                            },
                            child: const Icon(
                              Icons.camera_alt_rounded,
                            ),
                          ),
                          TextFormField(
                            controller: Global.PNameController,
                            decoration: InputDecoration(
                              hintText: "Enter Your Name...",
                            ),
                            onSaved: (val) {
                              Global.Pname = val!;
                            },
                          ),
                          TextFormField(
                            controller: Global.BioController,
                            decoration: InputDecoration(
                              hintText: "Enter You bio...",
                            ),
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
                      Switch(
                          value:
                              Provider.of<themeprovider>(context, listen: true)
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
          ],
        ),
      ),
    );
  }
}
