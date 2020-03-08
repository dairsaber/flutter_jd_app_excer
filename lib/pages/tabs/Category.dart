import 'package:flutter/material.dart';
import '../../utils/screen_adapter.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with AutomaticKeepAliveClientMixin {
  //伪造几个测试的右边栏的item
  final _leftWidgets = _getWidgets(20);
  int _currentIndex = 0;

  _handleTap(int index) {
    this.setState(() {
      this._currentIndex = index;
    });
  }

  _goProductList() {
    Navigator.pushNamed(context, "/productionList",
        arguments: {"index": _currentIndex});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(title: Text("分类")),
      body: Row(
        children: <Widget>[
          Container(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _leftWidgets[index](
                    color: _currentIndex == index ? Colors.cyan : Colors.white,
                    onTap: _handleTap);
              },
              itemCount: _leftWidgets.length,
            ),
            width: ScreenAdapter.width(250),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black12,
              child: Center(
                child: RaisedButton(
                  onPressed: _goProductList,
                  child: Text("$_currentIndex"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

typedef void MyOnTab(int index);
typedef Widget WidgetFunc({Color color, MyOnTab onTap});

List<WidgetFunc> _getWidgets(int num) {
  List<WidgetFunc> result = [];
  for (int i = 0; i < num; i++) {
    result.add(({Color color, MyOnTab onTap}) => Container(
            child: Column(children: <Widget>[
          Container(
            child: InkWell(
              onTap: () {
                print("ceshi $i");
                if (onTap == null) {
                  return;
                }
                onTap(i);
              },
              child: ListTile(
                title: Text("ceshi $i"),
                subtitle: Text("sub ceshi $i"),
              ),
            ),
            color: color ?? Colors.white,
          ),
          Divider(
            height: 0,
          )
        ])));
  }
  return result;
}
