main() {
  /**
   * 循环while for breake continue
   */

// ++  和-- 赋值运算中有区别，
  var a = 10;
  var b = a++; //先赋值再自增 a=11 b=10
  var c = 10;
  var d = ++c; //先自增再赋值 c=11 d=11
  print("a=$a");
  print("b=$b");
  print("c=$c");
  print("d=$d");

  var sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
    print("sum=$sum...i=$i");
  }

//集合的遍历
  var newsList = [
    {
      "cate": "国内",
      "news": [
        {'title': '国内新闻1'},
        {'title': '国内新闻2'},
        {'title': '国内新闻3'}
      ]
    },
    {
      "cate": "国际",
      "news": [
        {'title': '国际新闻1'},
        {'title': '国际新闻2'},
        {'title': '国际新闻3'}
      ]
    }
  ];
  for (var i = 0; i < newsList.length; i++) {
    print(newsList[i]["cate"]);
    var newsItems = newsList[i]["news"] as List;
    for (var j = 0; j < newsItems.length; j++) {
      print("  ${newsItems[j]['title']}");
    }

    // for (var m = 0; m < newsList[i]["news"].length; m++) {
    //   print("  ${newsList[i]["news"][m]["title"]}");
    // }
    print("---------");
  }

  //while循环,while和do while区别为第一次条件不成立时while循环不执行，dow while循环会执行一次
  var index = 0;
  while (++index < 10) {
    print("while循环:$index");
  }

  //循环中的break 和continue
  var index1=0;
  while (index1++ < 10) {
    if (index1 == 3) {
      // break;
      continue;
    }
    print("演示break和continue:$index1");
  }
}
