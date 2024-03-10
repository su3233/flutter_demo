import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/swiper.dart';

///pageView实现轮播图
///可通过PageView创建，也可通过PageView.Builder

main() {
  runApp(MaterialApp(
    title: "flutter viewPage",
    theme: ThemeData(primarySwatch: Colors.yellow),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("flutter viewPage"),
        backgroundColor: Colors.yellow,
      ),
      // body: const ViewPage(),
      body: const MyPage(),
    ),
  ));
}

// class ViewPage extends StatefulWidget {
//   const ViewPage({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ViewPage();
//   }
// }
//
// class _ViewPage extends State<ViewPage> {
//   int itemCount = 10;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       scrollDirection: Axis.vertical, // 滑动方向为垂直方向
//       itemBuilder: (BuildContext context, int index) {
//         return MyPage(text: "$index");
//       },
//       itemCount: 10,
//     );
//   }
// }

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Widget> pageList = [];

  @override
  void initState() {
    List listData = [
      {
        "imageUrl": 'https://www.itying.com/images/flutter/1.png',
      },
      {
        "imageUrl": 'https://www.itying.com/images/flutter/2.png',
      },
      {
        "imageUrl": 'https://www.itying.com/images/flutter/3.png',
      }
    ];
    for (int i = 0; i < listData.length; ++i) {
      pageList.add(PicturePage(
        url: listData[i]["imageUrl"],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Swiper(pageList: pageList)],
    );
  }
}
