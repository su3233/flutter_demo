import 'package:flutter/material.dart';

import '../bilibili/animatedList.dart';
import '../bilibili/animatio_hero.dart';
import '../bilibili/animation.dart';
import '../bilibili/getx.dart';
import '../bilibili/main.dart';
import '../bilibili/wrap.dart';
import '../pages/form.dart';
import '../pages/news.dart';
import '../pages/usersPages.dart';
import '../bilibili/router.dart';
import 'package:flutter_demo/bilibili/animation2.dart' as xianShi;
import 'package:flutter_demo/bilibili/animation3.dart' as jiaoCuo;
import 'package:flutter_demo/bilibili/aspectRatio.dart' as aspectRatio;
import 'package:flutter_demo/bilibili/button.dart' as myButton;
import 'package:flutter_demo/bilibili/flutterKey.dart' as key;
import 'package:flutter_demo/bilibili/flutterKeyGlobal.dart' as globalKey;
import 'package:flutter_demo/bilibili/grideView.dart' as gridView;
import 'package:flutter_demo/bilibili/layout.dart' as layout;
import 'package:flutter_demo/bilibili/pageView.dart';
import 'package:flutter_demo/bilibili/router2.dart' as router2;
import 'package:flutter_demo/bilibili/stateful.dart' as stateful;
import '../bilibili/appbar.dart' as appBar;
import '../bilibili/dialog.dart' as myDialog;
import '../bilibili/flutterKeyGlobalGetChildState.dart' as keyChild;
import '../bilibili/list.dart' as listPage;
import '../bilibili/stack.dart' as stack;

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
  '/getxPage': (context) => GetxPage(),
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
