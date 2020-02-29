import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MySwiper extends StatelessWidget {
  const MySwiper({Key key, this.items}) : super(key: key);
  final List items;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(items[index]["url"], fit: BoxFit.fill);
          },
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    ));
  }
}
