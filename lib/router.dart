import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/commonUtils.dart';
import 'pages/news.dart';
import 'pages/form.dart';

///路由包括普通路由和命名路由,
///要是路由根空间不能是MaterialApp，可以使用Builder传值
void main() {
  runApp(RouterPage());
}

class RouterPage extends StatelessWidget {
  RouterPage({super.key});

  final Map routes = {
    '/search': (context) => const SearchPage(),

    ///命名路由传值
    '/form': (context, {arguments}) => FormPage(
        // args: {"key": "123"},
        arguments: arguments),
    '/news': (context) => const NewsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "router",
      theme: ThemeData(primarySwatch: Colors.yellow),
      // initialRoute: "/news",//初始化路由
      onGenerateRoute: (RouteSettings settings) {
        final String? name = settings.name;
        final Function? pageContentBuilder = routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        return null;
      },
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("router"),
              backgroundColor: Colors.yellow,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      CommonUtils.showToast("命名路由跳转到news");
                      Navigator.pushNamed(context, "/news");
                    },
                    child: const Text("命名路由跳转到news")),
                ElevatedButton(
                    onPressed: () {
                      CommonUtils.showToast("普通路由跳转到form");
                      Navigator.pushNamed(context, "/form");
                    },
                    child: const Text("普通路由跳转到form")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/form",
                          arguments: {"title": "我是命名路由传值", "id": 123});
                    },
                    child: const Text("普通路由命名路由传值跳转到form")),
              ],
            ),
          );
        },
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
