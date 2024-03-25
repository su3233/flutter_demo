import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///中间件，跳转到shop时判断是否登陆

class ShopMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print("----$route");
    // return null;//不做任何操作
    return const RouteSettings(name: "/news", arguments: {}); //拦截路由。可判断是否登陆
  }
}
