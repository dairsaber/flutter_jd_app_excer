import 'package:flutter/material.dart';
import './tab_list.dart';
import 'package:flutter_jd_app/utils/index.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final _navItems = TabsConfig.getTabItems();
  void _onTabTap(index) {
    this.setState(() {
      this._currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //初始化适配器
    initPage(context);
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: Center(child: TabsConfig.tabsConfigs[_currentIndex]["page"]),
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: _onTabTap,
      ),
    );
  }
}
