import 'dart:async';

import 'package:flutter/material.dart';
import '../../services/event_bus.dart';

class Page2 extends StatefulWidget {
  Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _count = 0;
  StreamSubscription<ShowBottomModalEvent> eventAction;
  void _addCount(setModalState) {
    setModalState(() {
      _count++;
    });
  }

  @override
  void initState() {
    super.initState();
    eventAction = eventBus.on<ShowBottomModalEvent>().listen((event) {
      print(event);
      _showBottomModal(event.context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    eventAction.cancel();
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              /// ! 为了解决在此modal在点击的时候关闭的尴尬境地 [onTap] 中return false
              return GestureDetector(
                onTap: () {
                  return false;
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("01"),
                      Text("01"),
                      Text("01"),
                      Text("01"),
                      Text("01"),
                      Text("01"),
                      Text("01$_count"),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("关闭modal"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _addCount(setState);
                        },
                        child: Text("改变modal中的状态+1"),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: RaisedButton(
            child: Text("弹出底部modal"),
            onPressed: () {
              _showBottomModal(context);
            },
          ),
        ),
      ),
    );
  }
}
