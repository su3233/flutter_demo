import 'package:flutter/material.dart';
import 'package:flutter_demo/data/constants.dart';
import 'package:flutter_demo/utils/commonUtils.dart';

///hero动画
// main() {
//   runApp(MaterialApp(
//     title: "flutter交错式动画",
//     theme: ThemeData(primarySwatch: Colors.yellow),
//     home: const HeroPage(),
//   ));
// }

class HeroPage extends StatefulWidget {
  final Map arguments;

  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() {
    print("-----${arguments["image_url"]}");
    return _HeroPage();
  }
}

class _HeroPage extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter hero"),
        backgroundColor: Colors.yellow,
      ),
      body: Hero(
        tag: widget.arguments["image_url"]!!,
        child: AspectRatio(
            aspectRatio: 16 / 9,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.network(widget.arguments["image_url"]!!),
            )),
      ),
    );
  }
}
