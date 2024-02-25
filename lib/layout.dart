import 'package:flutter/material.dart';

///Padding,Row,Column,Flex,Expanded
///SizedBox相比Container更轻量
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("flutter list"),
        ),
        //封装+Row+布局
        body: Column(
          children: [
            // RowWidget(),
            ExpendedWidget(),
          ],
        ),
      ),
    );
  }
}

/// Expanded只能在Row、Column、Flex中使用
/// 可使用Expanded（flex=1）+一个固定宽度的控件，实现一个固定宽度+剩余充满的效果
class ExpendedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Row(
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1, //flex权重
          child: IconRowWidget(
            Icons.home,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconRowWidget(
            Icons.saved_search,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      //Column
      child: Row(
        //spaceBetween+外部Padding实现个人中心
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconRowWidget(Icons.home),
          IconRowWidget(
            Icons.search,
            color: Colors.red,
          ),
          IconRowWidget(Icons.ac_unit_sharp, color: Colors.blue),
        ],
      ),
    );
  }
}

//封装
class IconRowWidget extends StatelessWidget {
  IconData icon;
  Color color;

  IconRowWidget(this.icon, {super.key, this.color = Colors.yellow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
