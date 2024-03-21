import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'button.dart';

///wrap组件
void main() => runApp(
      MaterialApp(
        builder: FToastBuilder(),
        home: const Padding(
          padding: EdgeInsets.all(10),
          child: WrapPage(),
        ),
        navigatorKey: navigatorKey,
      ),
    );

class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("wrap"),
      ),
      body: Wrap(
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
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const MyButton(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black12)),
        child: Text(text));
  }
}
