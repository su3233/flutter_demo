import 'package:flutter/material.dart';

import '../pages/form.dart';
import '../pages/news.dart';
import '../router.dart';

final Map routes = {
  '/search': (context) => const SearchPage(),

  ///命名路由传值
  '/form': (context, {arguments}) => FormPage(
      // args: {"key": "123"},
      arguments: arguments),
  '/news': (context) => const NewsPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
