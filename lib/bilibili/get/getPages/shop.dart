import 'package:flutter/material.dart';
import 'package:flutter_demo/bilibili/get/getPages/realPay.dart';
import 'package:get/get.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("购物"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/createOrder");
                // Get.to(const RealPayPage());//普通路由
              },
              child: const Text("创建订单")),
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
