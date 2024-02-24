class Animal {
  late String name;
  late int _age; //私有属性只能类内部使用
  Animal(String name) {
    this.name = name;
  }
  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this._age = age;
  }

  _run() {
    print('私有方法');
  }

  void getRun() {
    this._run();
    print('通过共有方法访问私有方法');
  }
}
