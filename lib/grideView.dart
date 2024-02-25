import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        body: MyGrid(),
      ),
    );
  }
}

class MyGrid extends StatelessWidget {
  List<Widget> _initGridData() {
    List<Widget> temp = [];
    for (int i = 0; i < 12; i++) {
      temp.add(Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Text(
            "我是第$i个元素",
            style: const TextStyle(
              fontSize: 15,
            ),
          )));
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    //extent
    // return GridView.count(
    //   crossAxisCount: 2,
    //   padding: EdgeInsets.all(10),
    //   crossAxisSpacing: 10,
    //   mainAxisSpacing: 10,
    //   childAspectRatio: 0.7,
    //   children: _initGridData(),
    // );

    return GridView.builder(
        //通过builder构建
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1),
        itemCount: 13,
        itemBuilder: _initBuildData);
  }

  Widget _initBuildData(context, index) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Text(
          "我是第$index个元素",
          style: const TextStyle(
            fontSize: 15,
          ),
        ));
  }
}
