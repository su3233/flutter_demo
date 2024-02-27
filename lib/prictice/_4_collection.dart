void main() {
  /**
   * list\set集合
   */
  // listTest();
  // setTest();
  mapTest();
}

void listTest() {
// list
  var list = ['香蕉', '苹果', true, 123];
  var listTwo = ['香蕉', '苹果', true, 123];
  list.add(222);
  print(list);
  list.remove("香蕉");
  list.reversed.toList();
  list.addAll(listTwo);
  list.fillRange(1, 3, "aaa"); //改变某些值
  list.insert(1, "橘子");
  print(list.indexOf("香蕉"));
  print(list);
  var str = list.join('-'); //list转换为string##
  print('list转换为str：$str');
  var str1 = '苹果-橘子-aaa-aaa-222-香蕉-苹果-true-123'; //string转换为list
  var list2 = str1.split('-');
  print(list2);

//遍历 for循环和forEach
  list.forEach((element) {
    print(element);
  });
  for (var item in list) {
    print(item);
  }
  var changeList = list.map((e) => '---$e');
  print('changeList:$changeList');
  var ageList = [1, 2, 5, 6, 8, 34, 8, 6, 33];
  var newAgeList = ageList.where((element) => element > 5);
  print(newAgeList);

//any 有一个就返回true   every所有满足返回true
  var list22 = [
    2,
    36,
    2,
    7,
    5,
    4,
    33,
  ];
  var result = list22.any((element) => element > 4);
  print(result);
  var result2 = list22.every((element) => element > 3);
  print(result2);
}

void setTest() {
  //set
  print('set---------');
  var mySet = new Set();
  mySet.add('香蕉');
  print(mySet);
  print(mySet.toList()); //set转换为list
  //去重
  List sourList = ['香蕉', '苹果', '橘子', '苹果', '橘子' '苹果', '橘子'];
  Set s = new Set();
  s.addAll(sourList);
  print('去重$s');

//遍历
  mySet.forEach((element) {
    print('set:$element');
  });
}

void mapTest() {
  print('map--------');
  //创建map的2种方法
  var map1 = {'name': 'aaa', 'age': 22};
  Map map = {'name': '章三', 'age': 20, 'sex': '男'};
  print(map.isEmpty);
  print(map.keys.toList());
  print(map.values.toList());
  map.addAll({
    'work': ['送外卖', '炒饭']
  });
  print(map);
  map.remove('name');
  print(map);
  print(map.containsKey('age'));

//遍历
  map.forEach((key, value) {
    print('map遍历:$key:$value');
  });
}
