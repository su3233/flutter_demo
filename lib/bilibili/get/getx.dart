import 'package:flutter/material.dart';
import 'package:flutter_demo/prictice/_8_abstract.dart';
import 'package:get/get.dart';
import '../../pages/news.dart';
import 'getPages/counterGetx.dart';
import 'getPages/createOrder.dart';
import 'getPages/realPay.dart';
import 'getPages/shop.dart';
import 'getRouters.dart';
import '../../bilibili/get/middleware/shopMiddleWare.dart';
import '../../bilibili/get/controller/counter.dart';
import 'bindings/binding.dart';

///get对话框，主题，snackBar，
void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: getRouters, //配置路由和配置home是两种方式，不配置routes也可以使用路由
      // onGenerateRoute: onGenerateRoute,
      // ///如果已经定义home了，路由中就不能有/的路由
      // initialRoute: "/",
      ///使用onGenerateRoute+routes 或者使用getPages+initialRoute 二选一
      defaultTransition: Transition.rightToLeft,
      initialBinding: AllControllerBinding(), //全局绑定bindingControoler
      getPages: [
        GetPage(name: "/", page: () => const GetxPage()),
        GetPage(name: "/news", page: () => const NewsPage()),
        GetPage(
            name: "/shopPage",
            page: () => const ShopPage(),
            middlewares: [ShopMiddleWare()],
            transition: Transition.fade),
        GetPage(name: "/createOrder", page: () => const CreateOrderPage()),
        GetPage(name: "/realPay", page: () => const RealPayPage()),
        GetPage(name: "/counter", page: () => const CounterGetx()),
      ],
      // home: const GetxPage()
    ));

class GetxPage extends StatefulWidget {
  const GetxPage({super.key});

  @override
  State<StatefulWidget> createState() => _GetxPage();
}

class _GetxPage extends State<GetxPage> {
  RxInt count = 0.obs;
  final RxInt _num = RxInt(0);

  ///类的obs
  final _person = Person(2, "xiao mao").obs;

  ///数据共享
  CounterController counterController = Get.put(CounterController());

  //使用binding,就不需要put初始化，可以直接使用
  CounterController controller = Get.find();

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
                child: Obx(() => Text(
                    "$count....${_person.value.name}...controllerCounter:${counterController.counter}"
                    "..binding${controller.counter}")),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("计数器")),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/counter");
                  },
                  child: const Text("状态管理")),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/shopPage");
                  },
                  child: const Text("路由跳转")),
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
          onPressed: () {
            count++;
            _person.value.name = "xiao tu zi";
            _person.value = _person.value;

            ///数据共享getxController
            counterController.inc();

            ///两种方式
            // _person.value =Person(3, "xiao tu zi");
          }));

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
