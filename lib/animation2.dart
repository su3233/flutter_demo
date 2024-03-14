import 'package:flutter/material.dart';

///显示动画，可手动控制，(透明度，缩放，位移)
///SlideTransition+Tween+Offset 位移动画
main() {
  runApp(MaterialApp(
    title: "flutter 显示动画",
    theme: ThemeData(primarySwatch: Colors.yellow),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
            vsync: this, //让手机和屏幕的刷新频率一样
            duration: const Duration(seconds: 5),
            lowerBound: 0.5, //透明度（运动区间）
            upperBound: 1)
        // ..repeat(reverse: true)//级联操作
        ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          _controller.repeat();
          // _controller.forward();
          // _controller.reverse();
          // _controller.stop();
        },
      ),
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Center(
        // child: RotationTransition(
        //   // turns: _controller,
        //   //Tween配置运动的参数
        //   turns: _controller.drive(Tween(begin: 0.5, end: 1.2)),
        //   child: const FlutterLogo(
        //     size: 60,
        //   ),
        // ),
        ///位移动画
        child: SlideTransition(
          position: Tween(
                  begin: const Offset(0.0, 0.0), end: const Offset(0, 2))
              .chain(CurveTween(curve: Curves.decelerate)) //改变运动速率
              .chain(
                  CurveTween(curve: const Interval(0.4, 0.6))) //交错动画，会休息一会再运动
              .animate(_controller),
          child: const FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}
