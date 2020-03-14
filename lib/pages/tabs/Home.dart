import 'package:flutter/material.dart';
import '../../components/index.dart';
import '../../utils/screen_adapter.dart';

final _commonHeight = ScreenAdapter.height(20);
final _commonWidth = ScreenAdapter.width(20);
final _commonItemSize = ScreenAdapter.width(200);

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List<Widget> getHotItems(BuildContext context) {
  List<Widget> result = [];
  for (int i = 0; i < 10; i++) {
    result.add(InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/productionDetail",
            arguments: {"index": i});
      },
      child: Container(
          width: ScreenAdapter.width(220.0),
          height: ScreenAdapter.width(250.0),
          padding: EdgeInsets.only(right: _commonWidth),
          child: Column(children: <Widget>[
            Container(
              height: _commonItemSize,
              width: _commonItemSize,
              child: Image.network(
                  "https://www.itying.com/images/flutter/hot${i + 1}.jpg",
                  fit: BoxFit.cover),
            ),
            Container(
              height: ScreenAdapter.width(50),
              child: Center(child: Text('第$i张')),
            )
          ])),
    ));
  }
  return result;
}

//AutomaticKeepAliveClientMixin 用于保存页面状态
class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final List<Map> _imgList = [
    {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
    {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
    {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    super.build(context);
    return ListView(children: <Widget>[
      MySwiper(
        items: _imgList,
      ),
      SizedBox(height: _commonHeight),
      MyTitle("热门爆款"),
      SizedBox(height: _commonHeight),
      VerticalList(
        config: VerticalListConfig(
            itemExtent: ScreenAdapter.width(220.0),
            height: ScreenAdapter.width(250.0),
            padding: EdgeInsets.fromLTRB(_commonWidth, 0, _commonWidth, 0)),
        children: getHotItems(context),
      )
    ]);
  }
}
