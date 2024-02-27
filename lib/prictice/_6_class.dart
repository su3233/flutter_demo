
import 'bean/Animal.dart';
import 'bean/Rect.dart';

main() {
  /**
   * 类，构造函数，命名
   */
  Person person = new Person('李四', 55);
  person.name;
  person.setAge(23);
  person.getInfo();

  Person p1 = Person.now();

  //把类抽离到lib中
  Animal animal = new Animal("兔子");
  animal.setName("猴子");
  //使用_可以把属性和方法定义为私有（需要把类抽离为文件才有效）,私有方法只有在类中才能使用
  animal.getRun();
  animal.setAge(3);
  // animal._run();

  //get方法，通过属性的方式访问方法--
  var rect = new Rect();
  rect.myHeight; //直接访问方法
  rect.myHeight = 7; //属性方法，直接赋值
  print("get:${rect.get()}");
  print("get:${rect.myWidth}");
  print('${rect.area()}');
}

class Person {
  String name = "张三";
  int age = 22;

  //默认构造函数，默认构造函数只能有一个，命名构造函数可以写多个
  // Person(){
  //   print("类的构造函数");
  // }

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

//构造函数的简写方式
  // Person(this.name,this.age);

  //命名构造函数
  Person.now() {
    print('我是命名构造函数');
  }

  void getInfo() {
    print('$name...$age');
    print('${this.name}...${this.age}');
  }

  void setAge(int age) {
    this.age = age;
  }
}
