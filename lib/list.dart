import 'package:flutter/material.dart';
import 'package:flutter_demo/app/widget/myFonts.dart';
import 'package:flutter_demo/prictice/_9_enum.dart';

main() {
  runApp(const MyApp());
}

//横向列表高度自适应，纵向列表宽度自适应
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
        // body: const MyHomePage(),
        // body: const MyListContainer(),
        body: const MyListHor(),
      ),
    );
  }
}

class MyListHor extends StatelessWidget {
  const MyListHor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
              width: 120,
              decoration: BoxDecoration(color: Colors.yellow),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: Image.network(MyHomePage._imagePath),
                  ),
                  const Text("¥80.0"),
                ],
              )),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.red),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.grey),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class MyListContainer extends StatelessWidget {
  const MyListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(MyHomePage._imagePath),
        Container(
          padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: const Text(
            "标题",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(MyHomePage._imagePath),
        Image.network(MyHomePage._imagePath),
        Image.network(MyHomePage._imagePath),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const _imagePath =
      "https://pics0.baidu.com/feed/0eb30f2442a7d933f7c0526420464b1e73f00153.jpeg@f_auto?token=9f2355599b661de1b49379336ca0b621";

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.home),
          title: Text("我是一个列表"),
          trailing: Icon(Icons.arrow_right_sharp),
        ),
        Divider(),
        ListTile(
          leading: Image.network(_imagePath),
          title: const Text("尼格买提的牌对上了"),
          subtitle: const Text(
              "2月24日晚8点，央视播出《2024年元宵晚会》，在晚会上尼格买提再次表演魔术，为自己圆上了之前春晚扑克牌的失误。"),
          trailing: const Icon(Icons.arrow_right_sharp),
        ),
        Divider(),
        const ListTile(
          leading: Icon(MyFonts.shopCart),
          trailing: Icon(Icons.arrow_right_sharp),
          title: Text("我是一个列表"),
        ),
        Divider(),
      ],
    );
  }
}
