import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

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
  _toast(){
    Fluttertoast.showToast(
        msg: "网络连接错误",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Color(0xFFEEEEEE));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
        backgroundColor: Colors.yellow,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _toast();
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => _toast(),
                // ));
              },
              child: Text("Flutter Toast No Context"),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: () {
                _toast();
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => _toast(),
                // ));
              },
              child: Text("Flutter Toast Context"),
            ),
          ],
        ),
      ),
    );
  }
}