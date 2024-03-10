import 'package:flutter/material.dart';

/// GlobalKey用于全局保存组件的状态(横竖屏切换)和在父组件获取/改变子组件的状态
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list = [];
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();

  @override
  void initState() {
    super.initState();
    list = [
      Box(
        key: _key1,
        color: Colors.blue,
      ),
      Box(
        key: _key2,
        color: Colors.red,
      ),
      Box(
        key: _key3, //程序自动生成一个key
        color: Colors.orange,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).orientation);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.shuffle(); //打乱list的顺序
          });
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  Color color;

  Box({super.key, required this.color});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color)),
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
