import 'package:flutter/material.dart';

import '../animatedList.dart';
import '../animatio_hero.dart';
import '../animation.dart';
import '../pages/form.dart';
import '../pages/news.dart';
import '../pages/usersPages.dart';
import '../router.dart';
import 'package:flutter_demo/animation2.dart' as xianShi;
import 'package:flutter_demo/animation3.dart' as jiaoCuo;
import 'package:flutter_demo/appbar.dart' as appBar;
import 'package:flutter_demo/aspectRatio.dart' as aspectRatio;
import 'package:flutter_demo/button.dart' as myButton;
import 'package:flutter_demo/dialog.dart' as myDialog;
import 'package:flutter_demo/flutterKey.dart' as key;
import 'package:flutter_demo/flutterKeyGlobal.dart' as globalKey;
import 'package:flutter_demo/flutterKeyGlobalGetChildState.dart' as keyChild;
import 'package:flutter_demo/grideView.dart' as gridView;
import 'package:flutter_demo/layout.dart' as layout;
import 'package:flutter_demo/list.dart' as listPage;
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/pageView.dart';
import 'package:flutter_demo/router2.dart' as router2;
import 'package:flutter_demo/stack.dart' as stack;
import 'package:flutter_demo/wrap.dart' ;
import 'package:flutter_demo/stateful.dart' as stateful;

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
  '/animatedList': (context) => const ListPage(),
  '/animation': (context) => const AnimationPage(),
  '/animation2': (context) => const xianShi.HomePage(),
  '/animation3': (context) => const jiaoCuo.AnimationPage(),
  '/appBar': (context) => const appBar.MyApp(),
  '/aspectRatio': (context) => aspectRatio.MyApp(),
  '/button': (context) => myButton.MyApp(),
  '/dialog': (context) => const myDialog.MyApp(),
  '/key': (context) => const key.MyApp(),
  '/globalKey': (context) => const globalKey.MyApp(),
  '/keyChild': (context) => const keyChild.MyApp(),
  '/gridView': (context) => const gridView.MyApp(),
  '/layout': (context) => const layout.MyApp(),
  '/list': (context) => const listPage.ListPage(),
  '/widget': (context) => const WidgetPage(),
  '/pageView': (context) => const PageViewPage(),
  '/router': (context) => const RouterPage(),
  '/router2': (context) => const router2.MyApp(),
  '/stack': (context) => const stack.MyApp(),
  '/statefulWidget': (context) => const stateful.MyApp(),
  '/wrapPage': (context) => const WrapPage(),
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
