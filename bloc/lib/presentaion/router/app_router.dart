import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_tut/presentaion/screens/home_screen.dart';
import 'package:bloc_tut/presentaion/screens/second_screen.dart';
import 'package:bloc_tut/presentaion/screens/third_screen.dart';


class AppRouter {
  Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen());
        break;
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());
        break;
      default:
        return null;
    }
  }
}
