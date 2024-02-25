import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/widget/myFonts.dart';

void main() {
  // runApp(const MyApp());
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "你好flutter",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const MyAppTwo(),
          MyButton(),
          MyText(),
          const SizedBox(
            height: 20,
          ),
          MyImage(),
          const SizedBox(
            height: 20,
          ),
          MyIcon()
        ],
      ),
    ),
  ));
}

class MyIcon extends StatelessWidget {
  const MyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(height: 20),
        Icon(Icons.home, size: 20, color: Colors.red),
        Icon(Icons.category),
        SizedBox(width: 10),
        Icon(
          MyFonts.book,
          size: 20,
          color: Colors.red,
        ),
        Icon(
          MyFonts.shopCart,
          size: 20,
        )
      ],
    );
  }
}

/// 2、flutter图片组件Image，本地图片，远程图片，图片剪切，圆形图片
/// Image.Asset   Image.remote

class MyImage extends StatelessWidget {
  static const _imagePath =
      "https://pics0.baidu.com/feed/0eb30f2442a7d933f7c0526420464b1e73f00153.jpeg@f_auto?token=9f2355599b661de1b49379336ca0b621";

  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          // margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(color: Colors.grey),
          child: Image.network(
            _imagePath,
            fit: BoxFit.cover,
            // scale: 2,
            repeat: ImageRepeat.repeatX, //背景图片平铺
          ),
        ),
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                  image: NetworkImage(
                    _imagePath,
                  ),
                  fit: BoxFit.cover)),
        ),
        Container(
          // margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: ClipOval(
            child: Image.network(
              _imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        //本地图片
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Image.asset(
            "images/icon.png",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 50,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: const BoxDecoration(color: Colors.yellow),
        child: const Text(
          "你好FLutter你好FLutter你好FLutter你好FLutter",
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: Colors.black,
              decoration: TextDecoration.underline),
        ));
  }
}

class MyAppTwo extends StatelessWidget {
  const MyAppTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        //位移，旋转transform
        // transform: Matrix4.translationValues(10, 0, 0),
        transform: Matrix4.rotationZ(0.2),
        //旋转
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.red, width: 2),
            //可以实现圆形
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.blue, blurRadius: 20.0)],
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),
        child: const Text(
          "你好flutter",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 40,
        // margin: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        // padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: const Text(
          "按钮",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SharedPreferences Demo',
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
          child: FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                      );
                    }
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
