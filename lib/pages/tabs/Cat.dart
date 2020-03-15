import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/Counter.dart';

class Cat extends StatefulWidget {
  Cat({Key key}) : super(key: key);

  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text("${counterProvider.count}"),
      ),
    );
  }
}
