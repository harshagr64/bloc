import 'package:bloc_tut/constants/enum.dart';
import 'package:bloc_tut/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;
  HomeScreen({
    this.title,
    this.color,
  });
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('widget rebuild');
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: null,
        body: Center(
          child: Container(
              height: 200,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BlocBuilder<InternetCubit, InternetState>(
                        builder: (context, state) {
                          if (state is InternetConnected &&
                              state.connectionType == ConnectionType.Wifi) {
                            return Text('Wi fi');
                          } else if (state is InternetConnected &&
                              state.connectionType == ConnectionType.Mobile) {
                            return Text('Mobile');
                          } else {
                            return Text('Disconnected');
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                      Text(
                        'You have pushed the button this many times:',
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     FloatingActionButton(
                      //       onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                      //       child: Icon(Icons.remove),
                      //     ),
                      BlocConsumer<CounterCubit, CounterState>(
                        listener: (context, state) {
                          if (state.isIncremented) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Increamented'),
                              duration: Duration(milliseconds: 300),
                            ));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Decreamented'),
                              duration: Duration(milliseconds: 300),
                            ));
                          }
                        },
                        builder: (context, state) {
                          return Text('${state.counterValue}');
                        },
                      ),
                      //     FloatingActionButton(
                      //       onPressed: BlocProvider.of<CounterCubit>(context).increment,
                      //       child: Icon(Icons.add),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 24,
                      ),
                      MaterialButton(
                        color: widget.color,
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/second'),
                        child: Text('Go to second screen'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        color: widget.color,
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/third'),
                        child: Text('Go to third screen'),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
