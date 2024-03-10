import 'package:flutter/material.dart';

//Swiper组件
class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> pageList;

  const Swiper(
      {super.key,
      this.width = double.infinity,
      this.height = 200,
      required this.pageList});

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index % (widget.pageList.length);
                });
              },
              itemCount: 10000,
              itemBuilder: (context, index) {
                return widget.pageList[index % (widget.pageList.length)];
              }),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pageList.length, (i) {
              return Container(
                margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPageIndex == i ? Colors.blue : Colors.grey),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

//PicturePage 图片页面
class PicturePage extends StatefulWidget {
  final String url;
  final double width;
  final double height;

  const PicturePage(
      {super.key,
      required this.url,
      this.width = double.infinity,
      this.height = 200});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Image.network(widget.url, fit: BoxFit.cover),
    );
  }
}
