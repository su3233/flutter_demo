import 'package:flutter/material.dart';

///在Flutter中，Key是不能重复使用的，所以Key一般用来做唯一标识。组件在更新的时候，其状态的保
// 存主要是通过判断组件的类型或者key值是否一致。
///ValueKey （值key）把一个值作为key ，UniqueKey（唯一key）程序生成唯一的Key，当我们不知道
// 如何指定ValueKey的时候就可以使用UniqueKey，ObjectKey（对象key）把一个对象实例作为key。
//  GlobalKey（全局key），GlobalObjectKey（全局Objec key，和ObjectKey有点类似）
///LocalKey用于通过key判断组件内状态区分于其他组件，进行改变；
///GlobalKey用于全局保存组件的状态(横竖屏切换）和在父组件获取/改变子组件的状态

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
  List<Widget> list = [
    Box(
      key: const ValueKey(1),
      color: Colors.blue,
    ),
    Box(
      key: ObjectKey(Box(color: Colors.red)),
      color: Colors.red,
    ),
    Box(
      key: UniqueKey(), //程序自动生成一个key
      color: Colors.orange,
    )
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Column(
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
