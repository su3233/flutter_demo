
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() {
    return _NewsPage();
  }
}

class _NewsPage extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻页面"),
      ),
      body: const Center(
        child: Text("新闻页面"),
      ),
    );
  }
}
