import 'dart:io';
import 'package:clone_message_flutter/src/utils/app_theme.dart';
import 'package:clone_message_flutter/src/widget/chat_detail.dart';
import 'package:clone_message_flutter/src/widget/home.dart';
import 'package:clone_message_flutter/src/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/chatDetail": (BuildContext context) => ChatDetail(),
  "/profile": (BuildContext context) => Profile(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}


