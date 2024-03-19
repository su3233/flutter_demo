import 'package:flutter/material.dart';
import 'package:flutter_demo/bottomNavigationBar.dart';

import '../animatio_hero.dart';
import '../pages/form.dart';
import '../pages/news.dart';
import '../pages/usersPages.dart';
import '../router.dart';

final Map<String, WidgetBuilder> routes = {
  // '/': (context) => const CategoryPage(id: "3"),
  '/search': (context) => const SearchPage(),

  ///命名路由传值
  '/form': (context, {arguments}) => FormPage(
      // args: {"key": "123"},
      arguments: arguments),
  '/news': (context) => const NewsPage(),
  '/login': (context) => const LoginPage(),
  '/register_one': (context) => const RegisterOnePage(),
  '/register_two': (context) => const RegisterTwoPage(),
  '/register_three': (context) => const RegisterThreePage(),
  '/hero': (context, {arguments}) => HeroPage(arguments: arguments),
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
