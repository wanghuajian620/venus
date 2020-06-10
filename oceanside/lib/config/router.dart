import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oceanside/pages/mine/collect.dart';
import 'package:oceanside/pages/tab/index.dart';
import 'package:oceanside/widget/router_anim.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String collectList = 'collectList';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.tab:
        return NoAnimRouteBuilder(TabNavigator());
      case RouteName.collectList:
        return CupertinoPageRoute(builder: (_) => Collect());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ));
    }
  }
}
