import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MaterialApp(home: GetxPage()));

class GetxPage extends StatelessWidget {
  var count = 0.obs;

  GetxPage({super.key});

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: const Text("counter")),
      body: Center(
        child: Obx(() => Text("$count")),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => count++,
      ));
}
