import 'package:flutter/material.dart';
import 'package:flutter_jd_app/utils/index.dart';
import 'package:flutter_jd_app/utils/storage.dart';

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
  void _saveTolocal() async {
    await StorageUtils.setValue<int>("int", 255);
    await StorageUtils.setValue<double>("double", 236.25);
    await StorageUtils.setValue<Map>("Map", {"hehehda": 3344, "xda": "fsdf"});
    await StorageUtils.setValue<List>("List", [
      "xxdasa",
      {"xjdhak": 12125}
    ]);
  }

  int _int;
  double _double;
  Map _map;
  List _list;
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    _int = await StorageUtils.getValue<int>('int');
    _double = await StorageUtils.getValue<double>('double');
    _map = await StorageUtils.getValue<Map>('Map');
    _list = await StorageUtils.getValue<List>('List');
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(result);
    print(result2);
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: this._saveTolocal,
            child: Text("保存本地数据"),
          ),
          RaisedButton(
            child: Text("本地存储中获取int数据"),
            onPressed: () async {
              final myInt = await StorageUtils.getValue<int>("int");
              this.setState(() {
                _int = myInt;
              });
            },
          ),
          RaisedButton(
            child: Text("本地存储中获取doublue数据"),
            onPressed: () async {
              final myDouble = await StorageUtils.getValue<double>("double");
              this.setState(() {
                _double = myDouble;
              });
            },
          ),
          RaisedButton(
            child: Text("本地存储中获取map数据"),
            onPressed: () async {
              final myMap = await StorageUtils.getValue<Map>("Map");
              this.setState(() {
                _map = myMap;
              });
            },
          ),
          RaisedButton(
            child: Text("本地存储中获取List数据"),
            onPressed: () async {
              final myList = await StorageUtils.getValue<List>("List");
              this.setState(() {
                _list = myList;
              });
            },
          ),
          Container(child: Text("int==>$_int")),
          Container(child: Text("doublue==>$_double")),
          Container(child: Text("Map==>$_map")),
          Container(child: Text("List==>$_list")),
        ],
      ),
    );
  }
}
