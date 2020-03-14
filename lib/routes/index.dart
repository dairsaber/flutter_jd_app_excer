import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/productionList/ProductionList.dart';
import '../pages/keytest/swap_color1.dart';
import '../pages/keytest/swap_color2.dart';
import '../pages/keytest/swap_color3.dart';
import '../pages/keytest/swap_color4.dart';
import '../pages/productionDetail/ProductionDetail.dart';

typedef Widget BuildFunc(BuildContext context);

final Map<String, BuildFunc> _routes = {
  '/': (BuildContext context) => Tabs(),
  '/productionList': (BuildContext context, {arguments}) =>
      ProductionList(arguments: arguments),
  '/color1': (BuildContext context) => SwapColorDemo1(),
  '/color2': (BuildContext context) => SwapColorDemo2(),
  '/color3': (BuildContext context) => SwapColorDemo3(),
  '/color4': (BuildContext context) => SwapColorDemo4(),
  '/productionDetail': (BuildContext context, {Map arguments}) =>
      ProductionDetail(arguments: arguments)
};

class Routes {
  static Route onRoute(RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = _routes[name];
    if (pageContentBuilder == null) {
      throw "路由配置有误";
    }
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
}
