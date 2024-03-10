import 'dart:async';

import 'package:flutter/material.dart';

/// AnimatedList 和 ListView 的功能大体相似，不同的是， AnimatedList 可以在列表中插入或删除节点
main() {
  runApp(MaterialApp(
    title: "flutter animatedList",
    theme: ThemeData(primarySwatch: Colors.yellow),
    home: const ListPage(),
  ));
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final globalKey = GlobalKey<AnimatedListState>();
  bool flag = true;
  List<String> list = ["第一条数据", "第二条数据"];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildItem(context, index) {
    return ListTile(
        key: ValueKey(index),
        title: Text(list[index]),
        trailing: IconButton(
          icon: const Icon(Icons.delete), // 点击时删除
          onPressed: () => _deleteItem(context, index),
        ));
  }

  _deleteItem(context, index) {
    if (flag == true) {
      flag = false;
      print(index); //注意：删除后需要重新setState
      setState(() {
        // 删除过程执行的是反向动画，animation.value 会从1变为0
        globalKey.currentState!.removeItem(index, (context, animation) {
          //注意先build然后再去删除
          var item = _buildItem(context, index);
          list.removeAt(index);
          return FadeTransition(
            opacity: animation,
            child: item,
          );
        }, duration: const Duration(milliseconds: 500));
      }); //解决快速删除bug 重置flag
      const timeout = Duration(milliseconds: 600);
      Timer.periodic(timeout, (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 增加 animation.value 会从0变为1
          list.add("这是一个数据");
          globalKey.currentState!.insertItem(list.length - 1);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("AppBar组件"),
      ),
      body: AnimatedList(
          key: globalKey,
          initialItemCount: list.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: _buildItem(context, index),
            );
          }),
    );
  }
}
