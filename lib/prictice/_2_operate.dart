void main() {
  /**
   * 运算符
   */

  //算数运算符，+= *= /=  %=   ～/=
  var a = 13;
  var b = 5;
  a += 2;
  print(a / b); //除
  print(a % b); //取余
  print(a ~/ b); //取整

  //关系运算符
  print(a != b);
  print(a > b);

  //逻辑运算符
  var c = true;
  var d = false;
  print(!c);
  print(c || d);
  print(c && d);

  //赋值运算符
  int e = a + b;
  b ??= 23; //当b为空时，赋值为23

  //条件表达式
  var flag = true;
  var score = 22;
  if (score > 90) {
    print("优秀");
  } else {
    print("良好");
  }

  var sex = "男";
  switch (sex) {
    case "男":
      print("男人");
      break;
    case "女":
      print("女人");
      break;
    default:
  }

  String sexInfo = flag ? "男的" : "女的";
  print("三目运算符：" + sexInfo);

  String g = "1123";
  String f = g ?? ""; //当g为空时为他赋值
  print("??赋值" + f);
  print("空判断：${g.isEmpty}");

//类型转换,异常转换可用try catch
  var num = 2;
  String numInfo = num.toString();
  num = int.parse(numInfo);
  var numDouble = double.parse(numInfo);

  
}
