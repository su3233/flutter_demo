import 'package:flutter/material.dart';

///交错式动画(依次显示动画)
///
main() {
  runApp(MaterialApp(
    title: "flutter交错式动画",
    theme: ThemeData(primarySwatch: Colors.yellow),
    home: const AnimationPage(),
  ));
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() {
    // return _AnimationPage();
    return _SlidePage();
  }
}

class _SlidePage extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              flag ? _controller.forward() : _controller.reverse();
              flag = !flag;
            }),
        appBar: AppBar(
          title: const Text("flutter交错式动画"),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Column(
            children: [
              SlideBox(
                controller: _controller,
                color: Colors.blue[300],
                curve: const Interval(0.0, 0.3),
              ),
              SlideBox(
                controller: _controller,
                color: Colors.blue[500],
                curve: const Interval(0.2, 0.6),
              ),
              SlideBox(
                controller: _controller,
                color: Colors.blue[800],
                curve: const Interval(0.5, 1.0),
              ),
            ],
          ),
        ));
  }
}

class SlideBox extends StatelessWidget {
  final AnimationController controller;
  final Color? color;
  final Curve curve;

  const SlideBox(
      {super.key, required this.controller, this.color, required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(
          Tween(begin: const Offset(0.0, 0.0), end: const Offset(1.0, 0.0))
              .chain(CurveTween(curve: curve))),
      child: Container(
        width: 120,
        height: 60,
        color: color,
      ),
    );
  }
}

class _AnimationPage extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              flag ? _controller.forward() : _controller.reverse();
              flag = !flag;
            }),
        appBar: AppBar(
          title: const Text("flutter交错式动画"),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Stack(
            children: [
              ScaleTransition(
                scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                    .chain(CurveTween(curve: const Interval(0.3, 0.5)))),
                child: const Icon(
                  Icons.menu,
                  size: 40,
                ),
              ),
              ScaleTransition(
                scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                    .chain(CurveTween(curve: const Interval(0, 0.2)))),
                child: const Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
            ],
          ),
        ));
  }
}
