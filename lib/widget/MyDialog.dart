import 'dart:async';

import 'package:flutter/material.dart';

///自定义dialog，InkWell（点击事件，长按事件等）,倒计时后自动关闭
class MyDialog extends Dialog {
  final String title;
  final String content;
  final Function()? onTap;

  _showDialog(context) {
    Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      Navigator.pop(context);
      timer.cancel();
    });
  }

  const MyDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    _showDialog(context);
    return Material(
      //设置背景透明
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "提示！",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      //InkWell（点击事件，长按事件等）
                      child: InkWell(
                        onTap: onTap,
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    content,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
