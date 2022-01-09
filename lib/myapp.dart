import 'package:flutter/material.dart';
import 'config/Theme/myTheme.dart';
import 'utils/constant_variables.dart';
import 'view/screens/post_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstVar.APP_NAME,
      theme: MyTheme.myThemeData,
      home: PostScreen(),
    );
  }
}
