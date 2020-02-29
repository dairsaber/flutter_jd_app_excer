import 'package:flutter/material.dart';
import 'package:flutter_jd_app/utils/index.dart';

class MyTitle extends StatelessWidget {
  final String label;
  const MyTitle(this.label, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: setWidth(10)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.red, width: setWidth(4.0)))),
      child: Padding(
        padding: EdgeInsets.only(left: setWidth(10)),
        child: Text(
          label,
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
