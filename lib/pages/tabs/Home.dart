import 'package:flutter/material.dart';
import 'package:flutter_jd_app/components/index.dart';
import 'package:flutter_jd_app/utils/index.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> _imgList = [
    {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
    {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
    {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      MySwiper(
        items: _imgList,
      ),
      SizedBox(height: setHeight(20)),
      MyTitle("热门爆款")
    ]);
  }
}
