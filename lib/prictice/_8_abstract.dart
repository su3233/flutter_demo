main() {
  /**
   * 接口、抽象类、多态。可以多实现不能多继承，可以使用with
   * 只是需要定义规范，子类去实现，用implement。使用implement时父类中的普通方法（或属性）也需要实现
   * 子类实现的同时，需要使用父类中的方法，用extends
   */
  //抽象类
  var meiyuan = Meiyuan();
  meiyuan.pay();
  var renminbi = RenminBi();
  renminbi.pay(); //实现的方法
  renminbi.run(); //自定义的方法

  //多态，每个子类有不同的方法实现
  Money renmin = RenminBi();
  renmin.pay();

  //接口，普通类和抽象类都可以implement
  var mySql = MySql("http:www.baidu.com");
  mySql.add();
  mySql.update();

  //一个类实现多个接口
  var c = new C();
  c.printA();

  //使用with实现多实现特性，f可使用a，b中的属性和方法.
  //作为mixins的类只能继承自Object，就是D和E不能继承其他类
  //作为mixins的类不能有构造函数，一个类可以mixnis多个mixins类，
  //可以extends+with，Person, D, E如果有相同的方法，使用的是最后E的方法
  var f = new F();
  f.d;
  f.printD();
  f.printE();
  print('${f is D}...${f is E}');
}

// class F with D, E {}
// class F extends Person with D, E {
//   F(int age, String name) : super(age, name);
// }


class F with G, D, E {}

mixin class G {
  void printG() {}
}

class Person {
  String name;
  int age;
  Person(this.age, this.name);
  printInfo() {
    print('${this.name}...${this.age}');
  }
}

mixin class D {
  String d = 'this is d';
  void printD() {
    print('d');
  }
}

mixin class E {
  void printE() {
    print('e');
  }
}

class C implements A, B {
  @override
 late String name;

  @override
  printA() {
    print("c print a");
  }

  @override
  printB() {
    print('c print b');
  }
}

abstract class A {
  late String name;
  printA();
}

abstract class B {
  printB();
}

abstract class Db {
  late String uri;
  add();
  update();
  delete();

  query() {
    print('抽象类中的query');
  }
}

//mySql  manggoDb msSql
class MySql implements Db {
  MySql(this.uri);

  @override
  add() {
    print('mysql add:$uri');
  }

  @override
  delete() {
    print('mySql delete:$uri');
  }

  @override
  update() {
    print('mySql update:$uri');
  }

  @override
  String uri;

  @override
  query() {
    // TODO: implement query
    throw UnimplementedError();
  }
}

abstract class Money {
  pay(); //抽象方法

  void printInfo() {
    print('抽象类中的普通方法');
  }
}

class RenminBi extends Money {
  @override
  pay() {
    print('人民币。。。实现抽象方法');
  }

  run() {
    print('人民币run');
  }
}

class Meiyuan extends Money {
  @override
  pay() {
    print('美元。。。。实现抽象方法');
  }
}
