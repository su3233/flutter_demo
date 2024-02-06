void main() {
  print("object");

/**
 * 基本数据类型(变量、集合)
 */

// 变量
  var str = '你好';
  print(str);
  String hello = "hello";
  print(hello);

  int num = 123;
  print(num);

// 常量,final惰性初始化，第一次使用前才初始化
  const PI = 3.1415;
  print(PI);

  final numCons = 3.12;
  print(numCons);

  final a = DateTime.now();

// string类型，拼接
  String str1 = '''this
                    is 
                    str''';
  print(str1);

  if (str is String) {
    print("is string");
  } else if(str is int){
    print("is int");
  }

  print("$str...$str1");
  print(str + str1);

  double aa = 23.4;
  print(aa);

  bool result = true;
  if (result || (str == str1)) {
    print(1);
  } else {
    print(2);
  }

  // 集合,通过[]创建的即可容量可变化
  var list = ["a", "b"];
  var list1 = <int>[1, 2, 4];
  var list2 = [];
  var list3 = [1, 2, 3];
  // var list4 = new List();
  var list5 = List<String>.filled(3, "fill"); //固定长度的集合，其他创建的集合可以改变长度
  print(list5);
  print(list);
  print(list[0]);
  list1.indexOf(0);
  list.forEach((element) {
    print("遍历list:$element");
  });
  

  print(list1[2]);
  list1.add(22);
  print("添加数据:22   $list1");
  list1.length = 0;

// map集合
  // var map = new Map();
  var map={"name":"张三","age":20};
  print(map);
  map["sex"]=1;
  print("添加数据:$map");
  print("获取map的值:${map["name"]}");
}
