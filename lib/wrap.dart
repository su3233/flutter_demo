import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'button.dart';

///wrap组件
void main() => runApp(
      MaterialApp(
        builder: FToastBuilder(),
        home: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            // alignment: WrapAlignment.center,
            children: [
              MyButton(
                "第一集",
                onPressed: () {},
              ),
              MyButton(
                "第2集",
                onPressed: () {},
              ),
              MyButton(
                "第3集",
                onPressed: () {},
              ),
              MyButton(
                "第4集",
                onPressed: () {},
              ),
              MyButton(
                "第5集",
                onPressed: () {},
              ),
              MyButton(
                "第6集",
                onPressed: () {},
              ),
              MyButton(
                "第8集",
                onPressed: () {},
              ),
              MyButton(
                "第7集",
                onPressed: () {},
              ),
              MyButton(
                "第9集",
                onPressed: () {},
              ),
            ],
          ),
        ),
        navigatorKey: navigatorKey,
      ),
    );

class MyButton extends StatelessWidget {
  String text;
  void Function()? onPressed;

  MyButton(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black12)),
        child: Text(text));
  }
}
