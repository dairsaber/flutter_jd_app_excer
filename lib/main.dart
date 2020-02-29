import 'package:flutter/material.dart';
import './pages/tabs/tabs.dart';
import './routes/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Tabs(), onGenerateRoute: Routes.onRoute);
  }
}
