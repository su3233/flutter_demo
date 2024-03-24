import 'package:flutter/material.dart';
import 'package:flutter_demo/bilibili/get/getPages/shop.dart';
import 'package:get/get.dart';

import '../getx.dart';

class RealPayPage extends StatefulWidget {
  final Map arguments;

  const RealPayPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
    return _RealPayPage();
  }
}

class _RealPayPage extends State<RealPayPage> {
  @override
  void initState() {
    print(widget.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("支付"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Text("${widget.arguments["count"]}"),
          ElevatedButton(
              onPressed: () {
                Get.offAll(const GetxPage());
              },
              child: const Text("支付完成")),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed("/shopPage"); //返回根路由
                // Get.off(const ShopPage());//跳转到指定页面，没有返回按钮
              },
              child: const Text("支付完成去浏览")),
        ],
      ),
    );
  }
}
