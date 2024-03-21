import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter statefull",
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("flutter stateful"),
        ),
        body: MyStatefulwidget(),
      ),
    );
  }
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            _list.add("我是一条数据");
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
          children: _list.map((s) {
        return ListTile(
          title: Text(s),
        );
      }).toList()),
    );
  }
}
