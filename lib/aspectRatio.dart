import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///AspectRatio宽高比，card组件,CircleAvatar圆形组件
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "你好",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text("你好flutter"),
        ),
        // body: CardWidget(),
        // body: AspectRatioWidget(),
        body: CardListWidget(),
      ),
    );
  }
}

class CardListWidget extends StatelessWidget {
  const CardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                    "https://www.itying.com/images/flutter/1.png",
                    fit: BoxFit.cover),
              ),
              ListTile( 
                leading: ClipOval(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/1.png",
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
                title: Text("XXX"),
                subtitle: Text("xx"),
                trailing: CircleAvatar(
                  backgroundImage: NetworkImage("https://www.itying.com/images/flutter/1.png"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const Column(
              children: [
                ListTile(
                  title: Text(
                    "张三",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text("高级软件工程师"),
                ),
                Divider(),
                ListTile(
                  title: Text("电话：111"),
                )
              ],
            )),
        // SizedBox(height: 20,),
        const Card(
          child: Text("你好"),
        ),
      ],
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
