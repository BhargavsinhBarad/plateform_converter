// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../utils/Global.dart';
//
// class add_contact extends StatefulWidget {
//   const add_contact({Key? key}) : super(key: key);
//
//   @override
//   State<add_contact> createState() => _add_contactState();
// }
//
// class _add_contactState extends State<add_contact> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child: SingleChildScrollView(
//       child: Column(
//         children: [
//           if (Global.pic == null)
//             const CircleAvatar(
//               radius: 65,
//               child: Icon(CupertinoIcons.camera),
//             )
//           else
//             CircleAvatar(
//               radius: 65,
//               foregroundImage: FileImage(File(Global.pic!.path)),
//             ),
//           const SizedBox(height: 10),
//           CupertinoButton(
//             onPressed: () async {
//               final XFile? image =
//                   await Global.picker.pickImage(source: ImageSource.camera);
//               setState(() {
//                 Global.pic = image;
//               });
//             },
//             child: const Icon(CupertinoIcons.camera),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: Global.NameController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.manage_accounts),
//               hintText: "Enter Your Name",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             onSaved: (val) {
//               Global.Nmae = val!;
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             keyboardType: TextInputType.phone,
//             controller: Global.PhoneController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.phone),
//               hintText: "Enter Your phone Number",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             onSaved: (val) {
//               Global.phone = val!;
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: Global.ChatController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.chat),
//               hintText: "Chat Conversation",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             onSaved: (val) {
//               Global.chat = val!;
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               DateTime? pickdate = await showDatePicker(
//                 context: context,
//                 initialDate:
//                     Provider.of<DateProvider>(context, listen: false).d1.Date,
//                 firstDate: DateTime(2005),
//                 lastDate: DateTime(2050),
//               );
//               Provider.of<DateProvider>(context, listen: false)
//                   .pickDate(pickdate!);
//             },
//             child: Text("⌚ Pick a Date"),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               TimeOfDay? picktime = await showTimePicker(
//                 context: context,
//                 initialTime:
//                     Provider.of<DateProvider>(context, listen: false).t1.time,
//               );
//               Provider.of<DateProvider>(context, listen: false)
//                   .picktime(picktime!);
//             },
//             child: Text("⌚ Pick a TIme"),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Provider.of<ContactProvider>(context, listen: false)
//                     .addContacts(
//                   Contacts(
//                     Chat: Global.ChatController.text,
//                     Name: Global.NameController.text,
//                     MobileNumber: Global.PhoneController.text,
//                   ),
//                 );
//               },
//               child: Text("Save"))
//         ],
//       ),
//     ));
//   }
// }
