
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'button.dart';
///wrap组件
void main() => runApp(
  MaterialApp(
    builder: FToastBuilder(),
    home: MyApp(),
    navigatorKey: navigatorKey,
  ),
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}