import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static XFile? pic;
  static ImagePicker picker = ImagePicker();

  static String pic1 = '';
  static ImagePicker picker1 = ImagePicker();

  static XFile? pic2;
  static ImagePicker picker2 = ImagePicker();

  static TextEditingController NameController = TextEditingController();
  static TextEditingController ChatController = TextEditingController();
  static TextEditingController PhoneController = TextEditingController();

  static String Nmae = "";
  static String phone = "";
  static String chat = "";

  static String Pname = "";
  static String Bio = "";

  static TextEditingController PNameController = TextEditingController();
  static TextEditingController BioController = TextEditingController();
}
