import 'dart:ffi';

import 'package:flutter_demo/prictice/Person.dart';

void main() {
  print("123");

  /**
   * 声明可空，默认为null
   */
  String? a = "hello";
  print('$a');

  /**
   * b为空时返回？？后面的东西
   */
  String? b;
  print(b ?? "default");

  /*当b为空时，为他赋值*/
  b ??= "h";
  print('$b');

  int? num;
  print(num);

  Char? gg;
  print(gg);

  /*赋值*/
  String dd = '123';
  dd = '222';
  print('$dd');

  Person? person;
  // person = Person('zhangsan')
  print('${person?.name}');

  /**list
   * map
   * set
   * */
  final myList = ['a', 'b', 'c'];
  final list = <int>[];
  myList.add('d');
  bool hasEmpty = myList.any((element) => element.isEmpty);
  print('$hasEmpty');

  final set = {'a', 'b', 'c'};
  final set1 = <String>{};
  set.add('d');

  final map = {'one': 1, 'two': 2};
  final map1 = <int, String>{};

  /*级联 表达式的结果是对象的引用*/
  var person2 = Person();

  /*可选位置参数*/
  print('sumUp:${sumUp(1, 2)}');
  print('sumUpFive:${sumUpFive(1, 2, 3, 4, 5)}');
}

int sumUp(int? a, int? b) {
  return a! + b!;
}

int sumUpFive(int a, [int? b, int? c, int? d, int? e]) {
  int sum = a;
  if (b != null) sum += b;
  if (c != null) sum += c;
  if (d != null) sum += d;
  if (e != null) sum += e;
  return sum;
}
