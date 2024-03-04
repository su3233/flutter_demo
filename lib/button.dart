import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Elecatedbutton,TextButton,OutlineButton
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello flutter"),
        ),
        body:Column(children: [
          // TextButton(onPressed: onPressed, child: child);
        ],),
      ),
    );
  }
}
