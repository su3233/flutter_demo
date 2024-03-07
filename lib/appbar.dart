import 'package:flutter/material.dart';

/// AppBar TabBar
// TabBarView
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BottomNavigationBar",
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("data"),
        ),
      ),
    );
  }
}
