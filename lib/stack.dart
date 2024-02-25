import 'package:flutter/material.dart';

///Stack层叠组件，Align Stack，Position定位布局
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("flutter list"),
        ),
        //封装+Row+布局
        body: Column(
          children: [
            // RowWidget(),
            // ExpendedWidget(),
          ],
        ),
      ),
    );
  }
}