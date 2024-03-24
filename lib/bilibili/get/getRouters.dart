import 'package:flutter/material.dart';
import 'package:flutter_demo/bilibili/get/getPages/createOrder.dart';
import '../../pages/news.dart';
import 'getPages/realPay.dart';
import 'getPages/shop.dart';
import 'getx.dart';

///get路由
final Map<String, WidgetBuilder> getRouters = {
  '/': (context) => const GetxPage(),
  '/news': (context) => const NewsPage(),
  '/shopPage': (context) => const ShopPage(),
  '/createOrder': (context) => const CreateOrderPage(),
  '/realPay': (context, {arguments}) => RealPayPage(
        arguments: arguments,
      ),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = getRouters[name];
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
