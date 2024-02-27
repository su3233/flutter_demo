void main() {
  /**
   * 函数
   */
  print('函数-------');
  String info = printInfo();
  print(info);

//可选参数，默认参数--
  var user1 = printUserName("张三");
  var user2 =  printUserName("张三", 20);
  var user = printUserName("张三", 33, '男');
  print(user);

  //命名参数
  print('命名参数-----');
  print(printUserInfo2('lisi', age: 22));

  //把方法当作参数的方法，匿名方法--
  fn(fn1);
  fn3();

  /**
   * 箭头函数，匿名函数，闭包
   */
  var list = [1, 2, 1, 6, 8, 23];
  list.forEach((element) => {print("箭头函数。。。object")});

  var newList = list.map((e) => e > 2 ? e * 2 : e).toList();
  print('箭头函数。。$newList');

  //定义一个方法，输入一个数n，判断1-n是否有偶数
  print('定义一个方法，输入一个数n，判断1-n是否有偶数....');
  isHanOuShu(22);

  /**
   * 匿名方法，自执行方法，递归--
   */
  var printMe = (int m) {
    print("匿名方法-----$m");
  };
  printMe(2);

  //自执行方法--
  (() {
    print("自执行方法");
  });

  ((String str) {
    print('我是自执行方法....$str');
  })('参数');

  //递归，阶乘
  int sour = 1;
  void diGui(int m) {
    sour *= m;
    if (m == 1) {
      return;
    }
    diGui(m - 1);
  }

  diGui(5);
  print('递归。。。阶乘。。。$sour');

  //递归实现1-100的和
  fu(100);
  print(sum);

  //闭包，全局使用并且不占内存--
  var b = fun1();
  b();
  b();
}

fun1() {
  var num = 123;
  return () {
    num++;
    print('闭包。。。$num');
  };
}

var sum = 0;
void fu(int m) {
  sum += m;
  if (m == 0) {
    return;
  }
  m -= 1;
  fu(m);
}

//定义一个方法判断是否是偶数
bool isOuShu(int n) {
  if (n % 2 == 0) {
    return true;
  }
  return false;
}

isHanOuShu(int m) {
  for (var num = 1; num < m; num++) {
    if (isOuShu(num)) {
      print(num);
    }
  }
}

void fn(fn1) {
  fn1();
}

void fn1() {
  print("方法参数");
}
//--
var fn3 = () {
  print("匿名方法----");
};

String printUserInfo2(String name, {int age=0, String sex = '男'}) {
  if (age != null) {
    return 'name:$name age:$age  sex:$sex';
  } else {
    return 'name:$name age:保密  sex:$sex';
  }
}

String printUserName(
  String name, [
  int? age,
  String sex = '女',
]) {
  if (age != null) {
    return '姓名：$name..age:$age..sex:$sex';
  } else {
    return '姓名：$name..年龄保密';
  }
}

/// 方法内还可以写方法，但是只能在方法内调用##
String printInfo() {
  print("自定义方法");
  int neiBu() {
    print("内部方法aaa");
    outMethod();
    return 123;
  }

  neiBu();
  return 'abc';
}

void outMethod() {
  print('外部方法');
}
