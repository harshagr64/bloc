import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'package:bloc_tut/news_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc_tut/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_tut/presentaion/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerate,
      ),
    );
  }
}
