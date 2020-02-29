import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  Cat({Key key}) : super(key: key);

  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Text("Cat");
  }
}
