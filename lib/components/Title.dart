import 'package:flutter/material.dart';
import '../utils/screen_adapter.dart';

class MyTitle extends StatelessWidget {
  final String label;
  const MyTitle(this.label, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  color: Colors.red, width: ScreenAdapter.width(4.0)))),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
        child: Text(
          label,
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
