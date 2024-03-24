import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    title: "main",
    theme: ThemeData(primarySwatch: Colors.yellow),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.yellow,
      ),
      body:const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("data"),
    );
  }

}