main() {
  print('类的静态成员、操作符、类的继承');

  /// 静态方法不可以访问非静态成员，非静态方法可以访问静态成员，静态成员和方法可通过类直接访问
  var book = Book('平凡的世界', 333);
  Book.name;
  Book.getBookName();

  /**
   * 对象中的操作符，？条件判断 
   * as 类型转换
   * is 类型判断
   * ..级联操作
   */
  Book? b;
  b?.getBookPrice();
  print(b is Object);
  // (b as Book).getBookPrice();

  book
    ..price = 30
    ..author = "张三"
    ..getBookPrice();

  //继承extends，子类可复写父类的方法,父类有构造函数时子类要继承构造函数
  LoveBook loveBook = new LoveBook('11', 2222);
  loveBook.author = "lisi";

  //子类中复写父类的方法
}

class Book {
  /// 静态方法不可以访问非静态成员，非静态方法可以访问静态成员
  Book(this.author, this.price);
  Book.xxx(this.author, this.price); //匿名构造函数
  static String name="";
  static void getBookName() {
    print('$name...');
  }

  int price;
  String author;

  void getBookPrice() {}

  void getDefault(){

  }
}

class LoveBook extends Book {
  // LoveBook(String author, int price, String sex) : super(author, price) {
  //   this.sex = sex;
  // }

  //给匿名构造函数传参
  LoveBook(String author, int price) : super.xxx(author, price);
  late String sex;
  run() {
    super.getDefault(); //子类中调用父类的方法
    print('${this.sex}..${this.author}..${this.price}');
  }

  //重写父类的方法
  @override
  void getBookPrice() {
    print('我是复写父类的方法');
  }
}
