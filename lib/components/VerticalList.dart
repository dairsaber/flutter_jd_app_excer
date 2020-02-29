import 'package:flutter/material.dart';

class VerticalListConfig {
  final EdgeInsets padding;
  final double height;
  final double width;
  final double itemExtent;
  const VerticalListConfig(
      {this.padding,
      @required this.height,
      @required this.itemExtent,
      this.width = double.infinity});
}

class VerticalList extends StatefulWidget {
  final VerticalListConfig config;
  final List<Widget> children;
  VerticalList({@required this.children, @required this.config, Key key})
      : super(key: key);

  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.config.height,
      width: widget.config.width,
      padding: widget.config.padding,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return widget.children[index];
        },
        itemCount: widget.children.length,
        itemExtent: widget.config.itemExtent,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
