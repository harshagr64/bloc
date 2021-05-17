import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_tut/presentaion/screens/home_screen.dart';
import 'package:bloc_tut/presentaion/screens/second_screen.dart';
import 'package:bloc_tut/presentaion/screens/third_screen.dart';
import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _counterCubit, child: HomeScreen()));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: SecondScreen()));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _counterCubit, child: ThirdScreen()));
        break;
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
