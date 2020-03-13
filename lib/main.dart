import 'package:flutter/material.dart';
import './routes/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onRoute);
  }
}
