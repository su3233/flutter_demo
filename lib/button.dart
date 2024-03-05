import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/commonUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() => runApp(
      MaterialApp(
        builder: FToastBuilder(),
        home: MyApp(),
        navigatorKey: navigatorKey,
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    CommonUtils.showToast("普通按钮");
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => _toast(),
                    // ));
                  },
                  style: ButtonStyle(
                      //背景颜色
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                      //文字颜色
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text("普通按钮"),
                ),
                TextButton(
                    onPressed: () {
                      CommonUtils.showToast("文本按钮");
                    },
                    child: const Text("文本按钮")),
                OutlinedButton(
                    onPressed: () {
                      CommonUtils.showToast("带边框的按钮");
                    },
                    child: const Text("带边框的按钮")),
                IconButton(
                    onPressed: () {
                      CommonUtils.showToast("图标按钮");
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            Row(
              children: [
                ///自定义
                ElevatedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.send),
                    label: const Text("发送")),
                TextButton.icon(
                    onPressed: null, icon: Icon(Icons.info), label: Text("信息")),
                OutlinedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.add),
                  label: Text("增加"),
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.red, width: 2))),
                )
              ],
            ),
            Row(
              children: [
                ///按钮大小
                SizedBox(
                  width: 150,
                  height: 60,
                  child: ElevatedButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.send),
                      label: const Text("发送")),
                ),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      child: const Text("登录"),
                    ))
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("圆形按钮"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder(
                      side: BorderSide(color: Colors.blueAccent),
                    ))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
