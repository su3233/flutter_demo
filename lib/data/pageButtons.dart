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
         child: const Text("form page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/news");
         },
         child: const Text("news page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animation");
         },
         child: const Text("隐式动画 page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animation");
         },
         child: const Text("显示动画 page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/animation3");
         },
         child: const Text("交错动画 page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/appBar");
         },
         child: const Text("appBar page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/aspectRatio");
         },
         child: const Text("aspectRatio page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/button");
         },
         child: const Text("button page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/dialog");
         },
         child: const Text("dialog page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/key");
         },
         child: const Text("key page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/globalKey");
         },
         child: const Text("globalKey page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/keyChild");
         },
         child: const Text("keyChild page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/gridView");
         },
         child: const Text("gridView page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/layout");
         },
         child: const Text("layout page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/list");
         },
         child: const Text("list page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/router");
         },
         child: const Text("router page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/router2");
         },
         child: const Text("router2 page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/pageView");
         },
         child: const Text("pageView page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/widget");
         },
         child: const Text("widget page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/stack");
         },
         child: const Text("stack page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/statefulWidget");
         },
         child: const Text("statefulWidget page")),
     ElevatedButton(
         onPressed: () {
           Navigator.pushNamed(context, "/wrapPage");
         },
         child: const Text("wrapPage page")),
   ];
 }
