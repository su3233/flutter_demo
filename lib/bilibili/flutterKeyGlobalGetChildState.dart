import 'package:flutter/material.dart';

/// GlobalKey用于全局保存组件的状态和在父组件获取/改变子组件的状态
/// Flutter应用是由是Widget Tree、Element Tree 和 RenderObject Tree组成
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //1、获取子组件的状态 调用子组件的属性
          var state = (_globalKey.currentState as _BoxState);
          setState(() {
            state._count++;
          }); //2、获取子组件的属性
          var box = (_globalKey.currentWidget as Box);
          print(box.color); //3、获取子组件渲染的属性
          var renderBox =
          (_globalKey.currentContext!.findRenderObject() as RenderBox);
          print(renderBox.size);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Title'),
      ),
      body: Center(
        child: Box(
          key: _globalKey,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;

  const Box({Key? key, required this.color}) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  run() {
    print("run");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ))),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Center(
          child: Text("$_count"),
        ),
      ),
    );
  }
}
