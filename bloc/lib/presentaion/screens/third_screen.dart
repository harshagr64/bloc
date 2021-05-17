import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'second_screen.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;
  ThirdScreen({
    this.title,
    this.color,
  });
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    print('widget rebuild');
    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
            // height: 200,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                  child: Icon(Icons.remove),
                ),
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
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).increment,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (newContext) => BlocProvider.value(
                                          value: BlocProvider.of<CounterCubit>(context),
                                          child: SecondScreen(
                            title: 'Second Screen',
                            color: Colors.redAccent,
                          ),
                    )));
              },
              child: Text('Go to second screen'),
            ),
          ],
        )),
      ),
    );
  }
}
