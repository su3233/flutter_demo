import 'package:flutter/material.dart';

import 'utils/KeepAliveWrapper.dart';

/// BottomNavigationBar,Drawer(DrawerHeader,UserAccountsDrawerHeader),AppBar,TabBar
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //去掉debug图标
      debugShowCheckedModeBanner: false,
      title: "BottomNavigationBar",
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // leading: IconButton(
        //     icon: const Icon(Icons.menu),
        //     onPressed: () {
        //       print('menu Pressed');
        //     }),
        title: const Text('FlutterDemo'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Search Pressed');
              }),
          IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                print('more_horiz Pressed');
              })
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          //选中的颜色
// iconSize:35, //底部菜单大小
          currentIndex: _currentIndex,
          //第几个菜单选中
          type: BottomNavigationBarType.fixed,
          //如果底部有4个或者4个以上的菜单的时候就需要配置这个参数

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
          ]),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.red : Colors.blue,
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("大地老师"),
            accountEmail: const Text("dadi@itying.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://www.itying.com/images/flutter/3.png"),
            ),
            decoration: const BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                    fit: BoxFit.cover)),
            otherAccountsPictures: <Widget>[
              Image.network("https://www.itying.com/images/flutter/4.png"),
              Image.network("https://www.itying.com/images/flutter/5.png"),
              Image.network("https://www.itying.com/images/flutter/6.png")
            ],
          ),
          const ListTile(
            title: Text("个人中心"),
            leading: CircleAvatar(child: Icon(Icons.people)),
          ),
          const Divider(),
          const ListTile(
            title: Text("系统设置"),
            leading: CircleAvatar(child: Icon(Icons.settings)),
          )
        ],
      )),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("UserPage"),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("SettingPage"),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("MessagePage"),
    );
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("CategoryPage"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print("_tabController:${_tabController.index}"); //获取点击或滑动页面的索引值
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              // backgroundColor: const Color.fromARGB(255, 253, 247, 247),
              // elevation: 10,
              // title: const Text("Flutter App"),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black26,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(child: Text("热门")),
                  Tab(child: Text("推荐")),
                  Tab(child: Text("视频"))
                ],
              ),
            )),
        body: TabBarView(controller: _tabController, children: [
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("第二个tab"),
                ),
                ListTile(
                  title: Text("第二个tab"),
                ),
                ListTile(
                  title: Text("第二个tab"),
                ),
                ListTile(
                  title: Text("第二个tab"),
                ),
                ListTile(
                  title: Text("第二个tab"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("第三个tab"),
                ),
                ListTile(
                  title: Text("第三个tab"),
                ),
                ListTile(
                  title: Text("第三个tab"),
                ),
                ListTile(
                  title: Text("第三个tab"),
                ),
                ListTile(
                  title: Text("第三个tab"),
                ),
              ],
            ),
          )
        ]));
  }
}
