import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/productionList/ProductionList.dart';

typedef Widget BuildFunc(BuildContext context);

final Map<String, BuildFunc> _routes = {
  '/': (BuildContext context) => Tabs(),
  '/productionList': (BuildContext context, { arguments}) =>
      ProductionList(arguments: arguments)
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
