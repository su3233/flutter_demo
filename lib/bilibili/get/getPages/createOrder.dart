import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("确认订单"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/realPay", arguments: {"count": "30元"});
              },
              child: const Text("去支付,传值")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("返回")),
        ],
      ),
    );
  }
}
