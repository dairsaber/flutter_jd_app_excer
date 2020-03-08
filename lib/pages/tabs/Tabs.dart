import 'package:flutter/material.dart';
import './tab_list.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  PageController _pageController;
  //获取配置的tab按钮
  final _navItems = TabsConfig.getTabItems();
  final _pageList = TabsConfig.getPages();
  void _onTabTap(index) {
    this.setState(() {
      this._currentIndex = index;
      this._pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      this._pageController =
          new PageController(initialPage: this._currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: PageView(
        children: _pageList,
        controller: this._pageController,
      ),
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
