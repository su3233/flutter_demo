main() {
  print("main");
  /**
   * 空安全
   */
  // int a = 12;
  // a = null;//会有编译提示报错

//可定义可空类型，可返回可空类型
  // String? aa='32';
  // int? num=33;

  //！类型断言
// print(aa!.length);

//late 关键词,延迟初始化

//@required 要求参数不为空
}

class Person {
  // late String name;
  late String name;
  void setName(String name) {
    this.name = name;
  }
}
