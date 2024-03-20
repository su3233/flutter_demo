import 'package:flutter/material.dart';



 List<Widget> getPageButtons(BuildContext context){
   return [
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animatedList");
         },
         child: const Text("animatedList")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/form",
               arguments: {"title": "我是命名路由传值", "id": 123});
         },
         child: const Text("form")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/news");
         },
         child: const Text("news")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animation");
         },
         child: const Text("隐式动画")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animation");
         },
         child: const Text("显示动画")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animation3");
         },
         child: const Text("交错动画")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/appBar");
         },
         child: const Text("appBar")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/aspectRatio");
         },
         child: const Text("aspectRatio")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/button");
         },
         child: const Text("button")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/dialog");
         },
         child: const Text("dialog")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/key");
         },
         child: const Text("key")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/globalKey");
         },
         child: const Text("globalKey")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/keyChild");
         },
         child: const Text("keyChild")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/gridView");
         },
         child: const Text("gridView")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/layout");
         },
         child: const Text("layout")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/list");
         },
         child: const Text("list")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/router");
         },
         child: const Text("router")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/router2");
         },
         child: const Text("router2")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/pageView");
         },
         child: const Text("pageView")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/widget");
         },
         child: const Text("widget")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/stack");
         },
         child: const Text("stack")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/statefulWidget");
         },
         child: const Text("statefulWidget")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/wrapPage");
         },
         child: const Text("wrapPage")),
   ];
 }
