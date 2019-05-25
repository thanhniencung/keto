import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'views/takenote.dart';
import 'main.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/takenote':
        return MaterialPageRoute(builder: (_) => TakeNote());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
