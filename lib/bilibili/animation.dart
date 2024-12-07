import 'package:flutter/material.dart';

import '../data/constants.dart';

///动画：隐式动画（在控件外部加Animationxx动画）AnimatedContainer,AnimatedPadding，Opacity,AnimatedPosition(购物车)
///AnimatedSwitcher(子元素改变时动画)
///显示动画

main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.yellow),
    title: "flutter 动画",
    home: const AnimationPage(),
  ));
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() {
    return _AnimationPage();
  }
}

class _AnimationPage extends State<AnimationPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter 动画"),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      body: Column(
        children: [
          AnimatedContainer(
              //动画效果
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1, milliseconds: 400),
              color: Colors.blue,
              height: flag ? 100 : 200,
              width: flag ? 100 : 200,
              transform: flag
                  ? Matrix4.translationValues(0, 0, 0)
                  : Matrix4.translationValues(100, 0, 0)),
          Opacity(
            //透明度
            opacity: flag ? 1 : 0.5,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
          //文字大小动画
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blueAccent,
            child: AnimatedDefaultTextStyle(
              style: TextStyle(fontSize: flag ? 10 : 20, color: Colors.black),
              duration: const Duration(seconds: 2),
              child: const Text(
                "flutter",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.black12,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              transitionBuilder: (child, animator) {
                return ScaleTransition(
                  scale: animator,
                  child: FadeTransition(
                    opacity: animator,
                    child: child,
                  ),
                );
              },
              ///当AnimatedSwitcher中内容改变时执行动画，此处为iamge改变
              // child: flag
              //     ? const CircularProgressIndicator()
              //     : Image.network(
              //         imageUrl,
              //         fit: BoxFit.cover,
              //       ),
              ///当text中文字改变时，也可执行动画使用key，此处为text内容改变
              child: Text(
                key: UniqueKey(),
                flag ? "你好" : "flutter",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
