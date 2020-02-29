import 'package:flutter/material.dart';
import 'package:flutter_jd_app/utils/index.dart';

const List<int> testList = [1, 2, 3, 4, 5];

final result = Reducer.reduce<List, int>(testList, (prev, current, index) {
  if (current % 2 == 0) {
    prev.add(current);
  }
  return prev;
}, []);

final result2 = Reducer.reduce<Map, int>(testList, (prev, current, index) {
  prev[index] = current;
  return prev;
}, {});

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    print(result);
    print(result2);
    return Container(
      child: Text("test 页面"),
    );
  }
}
