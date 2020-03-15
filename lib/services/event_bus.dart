import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

final EventBus eventBus = EventBus();

class ShowBottomModalEvent {
  BuildContext context;
  String origin;
  ShowBottomModalEvent(this.context, {this.origin});
}
