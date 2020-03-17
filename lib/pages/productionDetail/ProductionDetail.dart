import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jd_app/utils/screen_adapter.dart';
import '../../services/event_bus.dart';
import './Page2.dart';

class ProductionDetail extends StatefulWidget {
  final Map arguments;
  ProductionDetail({Key key, this.arguments}) : super(key: key);

  @override
  _ProductionDetailState createState() => _ProductionDetailState();
}

enum TestMenu { home, other, test }

class _ProductionDetailState extends State<ProductionDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static const int _initIndex = 1;
  int _currentIndex = _initIndex;
  void _handleMenuSelected(TestMenu value) {
    switch (value) {
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

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, initialIndex: _initIndex, vsync: this);
    _tabController.addListener(() {
      this.setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // 顶部tab切换的写法
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.access_alarm),
                onPressed: () async {
                  // 弹出menu
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
              //tab 项
              child: TabBar(
                controller: _tabController,
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
      // ?对应tab显示的页面
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            Text("01_${widget.arguments['index']}"),
            // * 在这里实现底部弹出modal的选择框
            Page2(),
            Container(
              child: Center(
                child: RaisedButton(
                  onPressed: () async {
                    //自定义实现modal
                    // final result = await showDialog<bool>(
                    //     context: context,
                    //     builder: (context) {
                    //       return Material(
                    //         //创建透明层
                    //         type: MaterialType.transparency, //透明类型
                    //         child: Center(
                    //           //保证控件居中效果
                    //           child: SizedBox(
                    //               width: ScreenAdapter.width(420),
                    //               height: ScreenAdapter.height(300),
                    //               child: ClipRRect(
                    //                 borderRadius: BorderRadius.circular(8),
                    //                 child: Container(
                    //                     width: ScreenAdapter.width(420),
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.white,
                    //                       // shape: BoxShape.circle,
                    //                     ),
                    //                     child: Column(children: <Widget>[
                    //                       Expanded(
                    //                         flex: 1,
                    //                         child: Center(
                    //                           child: Text("确定么?"),
                    //                         ),
                    //                       ),
                    //                       Row(
                    //                         children: <Widget>[
                    //                           Material(
                    //                             //! 这边用Material和Ink包裹用于解决InkWell在Container设置颜色之后无法显示波纹效果的情况
                    //                             child: Ink(
                    //                               child: InkWell(
                    //                                 child: Container(
                    //                                   height:
                    //                                       ScreenAdapter.height(
                    //                                           80),
                    //                                   width:
                    //                                       ScreenAdapter.width(
                    //                                           210),
                    //                                   child: Center(
                    //                                     child: Text("确定"),
                    //                                   ),
                    //                                 ),
                    //                                 onTap: () {
                    //                                   Navigator.of(context)
                    //                                       .pop(true);
                    //                                 },
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           Material(
                    //                             child: Ink(
                    //                               child: InkWell(
                    //                                 child: Container(
                    //                                   height:
                    //                                       ScreenAdapter.height(
                    //                                           80),
                    //                                   width:
                    //                                       ScreenAdapter.width(
                    //                                           210),
                    //                                   child: Center(
                    //                                     child: Text("取消"),
                    //                                   ),
                    //                                 ),
                    //                                 onTap: () {
                    //                                   Navigator.of(context)
                    //                                       .pop(true);
                    //                                 },
                    //                               ),
                    //                             ),
                    //                           )
                    //                         ],
                    //                       )
                    //                     ])),
                    //               )),
                    //         ),
                    //       );
                    //     };

                    //用系统自带的集中dailog
                    // final result = await showDialog<bool>(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text("提示"),
                    //         content: Text("确定?"),
                    //         actions: <Widget>[
                    //           FlatButton(
                    //               child: Text(
                    //                 "确定",
                    //                 style: TextStyle(color: Colors.blueAccent),
                    //               ),
                    //               onPressed: () {
                    //                 Navigator.of(context).pop(true);
                    //               }),
                    //           FlatButton(
                    //               splashColor: Color.fromRGBO(255, 0, 0, 0.2),
                    //               child: Text(
                    //                 "取消",
                    //                 style: TextStyle(color: Colors.red),
                    //               ),
                    //               onPressed: () {
                    //                 Navigator.of(context).pop(false);
                    //               })
                    //         ],
                    //       );
                    //     });

                    //苹果风的确认框
                    final result = await showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("提示"),
                            content: Text("确定?"),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text(
                                    "确定",
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  }),
                              FlatButton(
                                  splashColor: Color.fromRGBO(255, 0, 0, 0.2),
                                  child: Text(
                                    "取消",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  })
                            ],
                          );
                        });
                    print(result);
                  },
                  child: Text("弹出确认框"),
                ),
              ),
            )
          ]),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                eventBus.fire(ShowBottomModalEvent(context));
              },
              child: Icon(Icons.shopping_cart))
          : null,
    );
  }
}
