main() {
  /**
   * 类，构造函数，命名
   */
  Person person = new Person('李四', 55);
  person.name;
  person.setAge(23);
  person.getInfo();

  Person p1=Person.now();
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
  Person.now(){
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
