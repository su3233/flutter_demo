
main() {
  /**
   * 范型，范型方法，范型类，范型接口
   */
//范型方法
  getValue<String>('aaa');
  getValue<int>(123);

  //范型类，范型接口和范型类一样类声明为abstract
  var list = new List<String>.filled(2, 'aaa');
  var myList = MyList();
  var myList1 = MyList<String>(); //指定类型
  myList.add('addd');
  myList.add(123);
  myList.add(true);
  print(myList.getList());

  //范型接口
  var memoryCache=MemoryCache<String>();
  memoryCache.setByKey('index', '首页数据');
  
}

class MemoryCache<T> implements Cache<T> {
  @override
  getByKey(String key) {}

  @override
  void setByKey(String key, T value) {
    print('我是内存缓存');
  }
}

class FileCache<T> implements Cache<T> {
  @override
  getByKey(String key) {}

  @override
  void setByKey(String key, T value) {
    print('我是文件缓存');
  }
}

abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}

class MyList<T> {
  List list = <T>[];
  add(T value) {
    this.list.add(value);
  }

  List getList() {
    return list;
  }
}

T getValue<T>(T value) {
  print('范型。。$value');
  return value;
}
