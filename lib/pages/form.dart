import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/commonUtils.dart';

class FormPage extends StatefulWidget {
  //命名路由传值
  final Map arguments;

  const FormPage({super.key, required this.arguments});

  @override
  State<FormPage> createState() {
    return _FormPage();
  }
}

class _FormPage extends State<FormPage> {
  @override
  void initState() {
    print("${widget.arguments}");
    CommonUtils.showToast("${widget.arguments}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表单页面"),
      ),
      body: const Center(
        child: Text("表单页面:"),
      ),
    );
  }
}
