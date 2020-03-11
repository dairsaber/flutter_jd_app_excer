import 'package:flutter/material.dart';

class ProductionList extends StatefulWidget {
  final arguments;

  ProductionList({Key key, this.arguments}) : super(key: key);

  @override
  _ProductionListState createState() => _ProductionListState();
}

class _ProductionListState extends State<ProductionList> {
  int _currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    setState(() {
      this._currentIndex = widget.arguments["index"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.arguments);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("商品列表$_currentIndex"),
        leading: Text(""),
        actions: <Widget>[Text("")],
      ),
      endDrawer: Drawer(
        child: MediaQuery.removePadding(
            context: context,
            child: Padding(
              child: Text("抽屉"),
              padding: EdgeInsets.only(top: 20),
            )),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
              child: Text("商品列表$_currentIndex"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/color1");
              },
              child: Text("01"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/color2");
              },
              child: Text("02"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/color3");
              },
              child: Text("03"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/color4");
              },
              child: Text("04"),
            ),
          ],
        ),
      ),
    );
  }
}
