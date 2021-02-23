import 'package:flutter/material.dart';

class TrackContext {
  static final GlobalKey key = new GlobalKey();
  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static BuildContext get currentContext {
    return key.currentContext;
  }
}
