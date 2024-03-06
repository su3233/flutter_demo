import 'package:flutter/material.dart';

main() {
  runApp(MyStatefulwidget());
}

class MyStatefulwidget extends StatefulWidget {
  const MyStatefulwidget({super.key});

  @override
  State<MyStatefulwidget> createState() {
    return _StateFul();
  }
}

class _StateFul extends State<MyStatefulwidget> {
  ///final定义常量只能赋一次值，list可以多次赋值
  final List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "flutter statefullWdiget",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _list.add("我是一条数据");
        });
      }),
      body: ListView(
          children: _list.map((s) {
        return ListTile(
          title: Text(s),
        );
      }).toList()),
    );
  }
}
