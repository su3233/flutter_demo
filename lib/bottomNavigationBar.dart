import 'package:flutter/material.dart';
import 'package:flutter_demo/data/listData.dart';
import 'package:flutter_demo/routers/routers.dart';

import 'data/pageButtons.dart';
import 'pages/usersPages.dart';
import 'utils/KeepAliveWrapper.dart';
// import 'package:flutter/cupertino.dart';

/// BottomNavigationBar,Drawer(DrawerHeader,UserAccountsDrawerHeader),AppBar,TabBar

///使android和ios使用相同的页面切换风格，import 'package:flutter/cupertino.dart';
/// 然后代码中MaterialPageRoute替换为CupertinoPageRoute
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去掉debug图标
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
      title: "BottomNavigationBar",
      // routes: routes,//配置路由和配置home是两种方式，不配置routes也可以使用路由
      // initialRoute: "/",//如果已经定义home了，路由中就不能有/的路由
      onGenerateRoute: onGenerateRoute,
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: Builder(builder: (BuildContext context) {
        return const Tabs();
      }),
    );
  }
}

class Tabs extends StatefulWidget {
  final int index;

  const Tabs({super.key, this.index = 0});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(id: "1"),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

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

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingPage();
  }
}

class _SettingPage extends State<SettingPage> {
  List<Widget> _initData() {
    var tempList = listData.map((value) {
      return GestureDetector(
        onTap: () {
          print("......${value["image_url"]}");
          Navigator.pushNamed(context, "/hero",
              arguments: {"image_url": value["image_url"]});
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(233, 233, 233, 233), width: 1)),
          child: Column(
            children: [
              Hero(
                  tag: "${value["image_url"]}",
                  child: Image.network("${value["image_url"]}")),
              Text(value["title"])
            ],
          ),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(5),
      children: _initData(),
    );
  }
}

///router
class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CategoryPage(title: "我来自MessagePage", id: "1");
          }));
        },
        child: const Text("跳转到CategoryPage"));
  }
}

class CategoryPage extends StatefulWidget {
  final String title;
  final String id;

  const CategoryPage(
      {super.key, this.title = "CategoryPage", required this.id});

  @override
  State<CategoryPage> createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  @override
  void initState() {
    print("收到：id${widget.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.message),
          onPressed: () {
            ///返回上个页面
            Navigator.pop(context);
          }),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Wrap(
          children: getPageButtons(context),
        ),
      ),
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

//生命周期函数，组件初始化时
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print("_tabController:${_tabController.index}"); //获取点击或滑动页面的索引值
      }
    });
  }

//生命周期函数，组件销毁时
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(

            ///也可以在appBar的title中直接写tabBar，tabBar使用Conrainer包裹设置高度
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              // backgroundColor: const Color.fromARGB(255, 253, 247, 247),
              // elevation: 10,
              // title: const Text("Flutter App"),
              bottom: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black26,
                indicatorSize: TabBarIndicatorSize.label,
                // onTap: (index) {
                //   ///只能监听tab的点击事件，不能监听滑动事件
                // },
                tabs: const [
                  Tab(child: Text("热门")),
                  Tab(child: Text("推荐")),
                  Tab(child: Text("视频")),
                  Tab(child: Text("体育")),
                  Tab(child: Text("新闻")),
                  Tab(child: Text("地方")),
                  Tab(child: Text("深圳")),
                  Tab(child: Text("北京")),
                  Tab(child: Text("奥运"))
                ],
              ),
            )),
        body: TabBarView(controller: _tabController, children: [
          ///KeepAliveWrapper保存滑动的状态
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
                ListTile(
                  title: Text("热门item"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
              child: ListView(
            children: const [
              ListTile(
                title: Text("推荐list"),
              )
            ],
          )),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("视频item"),
                ),
                ListTile(
                  title: Text("视频item"),
                ),
                ListTile(
                  title: Text("视频item"),
                ),
                ListTile(
                  title: Text("视频item"),
                ),
                ListTile(
                  title: Text("视频item"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("体育item"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("新闻list"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("地方list"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("深圳list"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("北京list"),
                ),
              ],
            ),
          ),
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("奥运list"),
                ),
              ],
            ),
          ),
        ]));
  }
}
