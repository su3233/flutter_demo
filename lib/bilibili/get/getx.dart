import 'package:flutter/material.dart';
import 'package:get/get.dart';

///get对话框，主题，snackBar，
void main() => runApp(const GetMaterialApp(home: GetxPage()));

class GetxPage extends StatefulWidget {
  const GetxPage({super.key});

  @override
  State<StatefulWidget> createState() => _GetxPage();
}

class _GetxPage extends State<GetxPage> {
  var count = 0.obs;

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
        title: const Text("counter"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            children: [
              Center(
                child: Obx(() => Text("$count")),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("计数器")),
              ElevatedButton(
                  onPressed: () {
                    _showBottomSheet();
                  },
                  child: const Text("切换主题")),
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar("title", "message",
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: const Text("snackBar")),
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "提示",
                        middleText: "确定删除吗？",
                        confirm: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("确定")),
                        cancel: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("取消")));
                  },
                  child: const Text("defaultDialog")),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => count++,
      ));

  void _showBottomSheet() {
    Get.bottomSheet(Container(
      color: Get.isDarkMode ? Colors.black87 : Colors.white,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.wb_sunny_sharp),
            title: Text(
              "白天模式",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black87),
            ),
            onTap: () {
              Get.changeTheme(ThemeData.light());
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined),
            title: Text(
              "晚上模式",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black87),
            ),
            onTap: () {
              Get.changeTheme(ThemeData.dark());
              Get.back();
            },
          ),
        ],
      ),
    ));
  }
}
