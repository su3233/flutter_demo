import 'package:flutter/material.dart';
import 'package:flutter_demo/data/constants.dart';
import 'package:flutter_demo/data/listData.dart';
import 'package:flutter_demo/utils/commonUtils.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

///hero动画,PhotoView图片预览
// main() {
//   runApp(MaterialApp(
//     title: "flutter交错式动画",
//     theme: ThemeData(primarySwatch: Colors.yellow),
//     home: const HeroPage(),
//   ));
// }

class HeroPage extends StatefulWidget {
  final Map arguments;

  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() {
    print("-----${arguments["image_url"]}");
    return _HeroPage();
  }
}

class _HeroPage extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter hero"),
        backgroundColor: Colors.yellow,
      ),
      body: Hero(
        tag: widget.arguments["image_url"]!!,
        child: AspectRatio(
            aspectRatio: 16 / 9,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              // child: Image.network(widget.arguments["image_url"]!!),
              //支持缩放
              // child: PhotoView(imageProvider: NetworkImage(widget.arguments["image_url"]!!)),
              //多张图预览
              child: PhotoViewGallery.builder(
                  itemCount: listData.length,
                  pageController: PageController(initialPage: 0),
                  onPageChanged: (index){
                    print("选中:$index");
                  },
                  builder: ((context, index) {
                    return PhotoViewGalleryPageOptions(
                        imageProvider:
                            NetworkImage(listData[index]["image_url"]));
                  })),
            )),
      ),
    );
  }
}
