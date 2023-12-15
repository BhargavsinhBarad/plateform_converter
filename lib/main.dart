import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plateform_converter/provider/Theme_provider.dart';
import 'package:plateform_converter/provider/contact_provider.dart';
import 'package:plateform_converter/provider/date_time.dart';
import 'package:plateform_converter/provider/platefrom.dart';
import 'package:plateform_converter/provider/profile.dart';
import 'package:plateform_converter/views/android.dart';
import 'package:plateform_converter/views/ios.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<platfrom>(
          create: (context) => platfrom(),
        ),
        ListenableProvider<themeprovider>(create: (context) => themeprovider()),
        ListenableProvider<DateProvider>(create: (context) => DateProvider()),
        ListenableProvider<switchprovider>(
            create: (context) => switchprovider()),
        ListenableProvider<ContactProvider>(
          create: (ctx) => ContactProvider(),
        ),
      ],
      builder: (context, _) =>
          (Provider.of<platfrom>(context, listen: true).isios == false)
              ? MaterialApp(
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: (Provider.of<themeprovider>(context, listen: true)
                              .theme
                              .isdark ==
                          true)
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  debugShowCheckedModeBanner: false,
                  home: android(),
                )
              : CupertinoApp(
                  theme: (Provider.of<themeprovider>(context, listen: true)
                              .theme
                              .isdark ==
                          true)
                      ? CupertinoThemeData(brightness: Brightness.dark)
                      : CupertinoThemeData(brightness: Brightness.light),
                  debugShowCheckedModeBanner: false,
                  home: ios(),
                ),
    ),
  );
}
