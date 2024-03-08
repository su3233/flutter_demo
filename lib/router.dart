import 'package:flutter/material.dart';
import 'package:flutter_demo/list.dart';
import 'package:flutter_demo/utils/commonUtils.dart';

///路由包括普通路由和命名路由
void main() {
  runApp(const RouterPage());
}

class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "router",
      theme: ThemeData(primarySwatch: Colors.yellow),
      routes: {
        // '/':(contxt)=>const Tabs(),
        '/search':(contxt) => const SearchPage(),
        // '/form': (context) => const FormPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("router"),
          backgroundColor: Colors.yellow,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  CommonUtils.showToast("to page 1");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ListPage();
                  }));
                },
                child: Text("to page 1"))
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  final String title;

  const SearchPage({super.key, this.title = "Search Page"});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("组件居中"),
      ),
    );
  }
}
