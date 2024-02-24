class Rect {
  /**
   * 私有属性和方法，get和set方法
   */

  num height;
  num width;

  Rect()
      : height = 2,
        width = 5 {
    //构造函数赋初始值
    print('${this.height}...${this.width}'); //在类初始化之前赋值
  }
  num area() {
    print('-----类中的属性方法');
    return this.height * this.width;
  }

  get myHeight {
    print('-----类中的get方法');

    return this.height;
  }

  set myHeight(value) {
    print('-----类中的set方法');

    this.height = value;
  }
}
