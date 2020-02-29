import 'package:flutter/material.dart';
import 'Home.dart';
import 'User.dart';
import 'Category.dart';
import 'Cat.dart';

class TabsConfig {
  static final tabsConfigs = [
    {
      "tabItem":
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
      "page": Home()
    },
    {
      "tabItem": BottomNavigationBarItem(
          icon: Icon(Icons.category), title: Text("分类")),
      "page": Category()
    },
    {
      "tabItem": BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), title: Text("购物车")),
      "page": Cat()
    },
    {
      "tabItem":
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的")),
      "page": User()
    },
  ];
  static List<BottomNavigationBarItem> getTabItems() {
    return tabsConfigs
        .map((item) => item['tabItem'] as BottomNavigationBarItem)
        .toList();
  }
}
