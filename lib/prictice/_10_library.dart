import 'bean/Person1.dart';
import 'yyUtils.dart' show getAge;
import 'bean/Person2.dart' as lib;

import 'dart:math';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
// import 'package:provider/provider.dart';

main() async {
  print("自定义库，系统库，第三方库");
  /**
   * 自定义库，系统库，第三方库
   */
  min(12, 5);

//只有async才能使用await
  testSync();

/**
 * 第三方库：
 * https://pub.dev/packages
 * https://pub.flutter-io.cn/packages
 * https://pub.dartlang.org/flutter
 */
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
  // var url =
  //     "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);

    // var jsonResponse =
    //     convert.jsonDecode(response.body) as Map<String, dynamic>;
    // var itemCount = jsonResponse['totalItems'];
    // print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  //日期库
  print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));
  print(formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));

  //两个库中冲突的类，重命名˝˝
  Person person1 = new Person('name');
  lib.Person person2 = new lib.Person('name', 2);

  //部分导入，引入库中的部分方法
//import 'package:flutter_application_/prictice/yyUtils.dart' show getAge;
  getAge();
}

testSync() async {
  return 'hello';
}
