import 'package:flutter/material.dart';
import './routes/index.dart';
import 'package:provider/provider.dart';
import './provider/Counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用MutiProvider注入状态
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Counter())],
        child: MaterialApp(
            initialRoute: "/",
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.onRoute));
  }
}
