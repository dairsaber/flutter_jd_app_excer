import 'package:flutter/material.dart';
import 'package:flutter_jd_app/utils/screen_adapter.dart';

class ProductionDetail extends StatefulWidget {
  final Map arguments;
  ProductionDetail({Key key, this.arguments}) : super(key: key);

  @override
  _ProductionDetailState createState() => _ProductionDetailState();
}

enum TestMenu { home, other, test }
_handleMenuSelected(TestMenu value){
  switch(value){
    case TestMenu.home:
    print("home");
    break;
    case TestMenu.other:
    print("other");
    break;
    case TestMenu.test:
    print("test");
    break;
    default:
    print("error");
  }
}
class _ProductionDetailState extends State<ProductionDetail> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.access_alarm),
                  onPressed: () async {
                    TestMenu value = await showMenu<TestMenu>(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            ScreenAdapter.width(600), 70, 0, 0),
                        items: [
                          PopupMenuItem(
                              enabled: false,
                              value: TestMenu.home,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.access_time),
                                  Text("home")
                                ],
                              )),
                          PopupMenuItem(
                              value: TestMenu.other,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.account_balance_wallet),
                                  Text("other")
                                ],
                              )),
                          PopupMenuItem(
                              value: TestMenu.test,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(Icons.add_a_photo),
                                  Text("test")
                                ],
                              )),
                        ]);
                    _handleMenuSelected(value);
                  })

            ],
            title: Center(
              child: Container(
                width: ScreenAdapter.width(400),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(child: Text("详情")),
                    Tab(
                      child: Text("评价"),
                    ),
                    Tab(
                      child: Text("参数"),
                    )
                  ],
                  indicatorColor: Colors.yellow,
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ),
            )),
        body:
            TabBarView(children: <Widget>[Text("01_${widget.arguments['index']}"), Text("02"), Text("03")])
      ),
      length: 3,
    );
  }
}
