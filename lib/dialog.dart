import 'package:flutter/material.dart';
import 'package:flutter_demo/aspectRatio.dart';

///AlertDialog,SimpleDialog,SimpleDialogOption
main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "dialog",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const DialogPage(),
    );
  }
}

//横向列表高度自适应，纵向列表宽度自适应
class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DialogPages();
  }
}

class _DialogPages extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter dialog"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: _alertDialog, child: const Text("AlertDialog")),
          ElevatedButton(
              onPressed: _simpleDialog, child: const Text("SimpleDialog")),
         ElevatedButton(
              onPressed: _modelBottomSheet,
              child: const Text("showModalBottomSheet")),
        ],
      ),
    );
  }

  _modelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 220,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text("分享 A"),
                  onTap: () {
                    Navigator.pop(context, "分享 A");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("分享 B"),
                  onTap: () {
                    Navigator.pop(context, "分享 B");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("分享 C"),
                  onTap: () {
                    Navigator.pop(context, "分享 C");
                  },
                )
              ],
            ),
          );
        });
    print(result);
  }

  _simpleDialog() async {
    var result = await showDialog(
        barrierDismissible: true, //表示点击灰色背景的时候是否消失弹出
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("请选择内容"),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text("Option A"),
                onPressed: () {
                  print("Option A");
                  Navigator.pop(context, "A");
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("Option B"),
                onPressed: () {
                  print("Option B");
                  Navigator.pop(context, "B");
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("Option C"),
                onPressed: () {
                  print("Option C");
                  Navigator.pop(context, "C");
                },
              ),
            ],
          );
        });
    print(result);
  }

  _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: false,
        //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息!"),
            content: const Text("您确定要删除吗?"),
            actions: <Widget>[
              TextButton(
                child: const Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.pop(context, 'Cancle');
                },
              ),
              TextButton(
                child: const Text("确定"),
                onPressed: () {
                  print("确定");
                  Navigator.pop(context, "Ok");
                },
              )
            ],
          );
        });
    print(result);
  }
}
