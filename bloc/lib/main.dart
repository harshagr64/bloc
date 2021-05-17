import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'package:bloc_tut/news_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc_tut/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_tut/presentaion/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenerate,
    );
  }
}
