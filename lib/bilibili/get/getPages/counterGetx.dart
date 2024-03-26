import 'package:flutter/material.dart';
import 'package:flutter_demo/bilibili/get/controller/counter.dart';
import 'package:get/get.dart';

import '../getx.dart';

///通过getxController实现跨页面数据共享
class CounterGetx extends StatefulWidget {
  const CounterGetx({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterPage();
  }
}

class _CounterPage extends State<CounterGetx> {
  // var counterController = Get.find<CounterController>();
  CounterController counterController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("counter"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Obx(() => Text(
                "${counterController.counter}",
                style: const TextStyle(fontSize: 20),
              )),
          // ElevatedButton(
          //     onPressed: () {
          //       Get.offAll(const GetxPage());
          //     },
          //     child: const Text("支付完成")),
        ],
      ),
    );
  }
}
