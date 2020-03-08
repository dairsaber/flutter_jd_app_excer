import 'package:flutter/material.dart';

class ProductionList extends StatefulWidget {
  final arguments;

  ProductionList({Key key, this.arguments}) : super(key: key);

  @override
  _ProductionListState createState() => _ProductionListState();
}

class _ProductionListState extends State<ProductionList> {
  int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this._currentIndex = widget.arguments["index"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表$_currentIndex"),
      ),
      body: Center(
        child: Text("商品列表$_currentIndex"),
      ),
    );
  }
}
