import 'package:flutter/material.dart';
import 'package:flutter_demo/app/widget/myFonts.dart';
import 'package:flutter_demo/prictice/_9_enum.dart';
import 'package:flutter_demo/data/listData.dart';

main() {
  runApp(const ListPage());
}

//横向列表高度自适应，纵向列表宽度自适应
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("flutter list"),
          backgroundColor: Colors.yellow,

        ),
        // body: const MyHomePage(),//listView
        // body: const MyListContainer(),//list内部Container
        // body: const MyListHor(),//横向列表
        body: MyListDynamicData(), //列表动态数据
      ),
    );
  }
}

class MyListDynamicData extends StatelessWidget {
  List<String> list = [];

  MyListDynamicData({super.key}) {
    print(listData);
    for (int i = 0; i < 20; i++) {
      list.add("我是第$i条数据");
    }
  }

  List<Widget> _initData() {
    List<Widget> datas = [];
    for (int i = 0; i < 20; i++) {
      datas.add(ListTile(
        title: Text("你好flutter_$i"),
      ));
    }
    return datas;
  }

  List<Widget> _initRealData() {
    var tempList = listData.map((value) {
      return ListTile(
        leading: Image.network("${value["image_url"]}"),
        title: Text("${value["title"]}"),
        subtitle: Text("${value["author"]}"),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   // children: _initData(),//三种填充数据的方法
    //   // children: _initRealData(),
    // );

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]),
          );
        });
  }
}

class MyListHor extends StatelessWidget {
  const MyListHor({super.key});

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
