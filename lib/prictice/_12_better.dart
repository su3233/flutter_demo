
main() {
  print("性能优化、identical函数--------");

  /**
   * 性能优化、identical函数
   */

  //cons（运行时常量，允许声明后再赋值）和final（编译时确定，不可改变）修饰常量
  // final a;
  // a = 12;

  //indentical函数检查两个引用是否指向同一个对象
  // var o1=Object();
  // var o2=Object();
  // print(identical(o1, o2));//false
  // print(identical(o1, o1));//true

  var o1 = const Object();
  var o2 = const Object();
  print(identical(o1, o2)); //true
  print(identical(o1, o1)); //true
//const在多个地方创建相同对象时，内存中指向同一个对象
  print(identical([2], [2])); //false
  print(identical(const [2], const [2])); //true

  //常量构造函数const 在项目重新构建时，不重新构建const的组件，节省内存空间
  var c1 = Container(width: 5, height: 5);
  var c2 = Container(width: 5, height: 5);
  print(identical(c1, c2));//false

  var c3 = const Container(width: 5, height: 5);
  var c4 = const Container(width: 5, height: 5);
  print(identical(c3, c4));//true
}

class Container {
  final int width;
  final int height;
  const Container({required this.height, required this.width});
}
