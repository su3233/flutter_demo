import 'package:flutter/material.dart';

///Stack层叠组件，Align Stack，Position定位布局
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
        // body: const Column(
        //   children: [
            // PositionStackWidget(),
            body: ListViewIdleWidget(),
        //   ],
        // ),
      ),
    );
  }
}
///Align,Stack放在容器内是相对外部定位
class ListViewIdleWidget extends StatelessWidget {
  const ListViewIdleWidget({super.key});


  @override
  Widget build(BuildContext context) {
    //获取屏幕宽高
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ListView(
          children:const [
            ListTile(title: Align(alignment:Alignment.centerRight,child: Text("我是item"),)),
            ListTile(title: Align(alignment:Alignment.centerRight,child: Text("我是item"),)),
            ListTile(title: Align(alignment:Alignment.centerRight,child: Text("我是item"),)),
            ListTile(title: Align(alignment:Alignment.centerRight,child: Text("我是item"),)),
            ListTile(title: Align(alignment:Alignment.centerRight,child: Text("我是item"),)),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
            ListTile(title: Text("我是item")),
          ],
        ),
        Positioned(
            top: 0,
            width: size.width,//子控件的宽高
            height: 44,
            // child: Row(
            //   children: [
            //     Expanded(
            //         flex: 1,
                    child: Container(
                      color: Colors.black54,
                      height: 44,
                      alignment: Alignment.center,
                      child: const Text(

                        "二级导航",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
            //   ],
            // ))
      ],
    );
  }
}

class PositionStackWidget extends StatelessWidget {
  const PositionStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.red,
      child: Stack(
        children: [
          //相对于外部容器进行定位
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              )),
          const Positioned(right: 0, top: 190, child: Text("你好flutter"))
        ],
      ),
    );
  }
}
