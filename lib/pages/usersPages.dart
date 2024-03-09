import 'package:flutter/material.dart';

import '../bottomNavigationBar.dart';

///路由跳转，路由替换，返回根路由
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/login");
              },
              child: const Text("登陆")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/register_one");
              },
              child: const Text("注册")),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("登陆"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ///通过路由返回上一级
                Navigator.of(context).pop();
              },
              child: const Text("登陆成功"))
        ],
      ),
    );
  }
}

class RegisterOnePage extends StatelessWidget {
  const RegisterOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("注册第一步"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register_two");
              },
              child: const Text("下一步"))
        ],
      ),
    );
  }
}

class RegisterTwoPage extends StatelessWidget {
  const RegisterTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("注册第二步"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/register_three");
                ///跳转时，当前页面不入栈
                Navigator.of(context).pushReplacementNamed("/register_three");
              },
              child: const Text("下一步"))
        ],
      ),
    );
  }
}

class RegisterThreePage extends StatelessWidget {
  const RegisterThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("注册第三步"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed("/register_one");
                ///返回根路由
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const Tabs(index: 4,);
                }), (route) => false);
              },
              child: const Text("返回第一步"))
        ],
      ),
    );
  }
}
