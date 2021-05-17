import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tut/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final Color color;
  SecondScreen({this.title, this.color});
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
              onPressed: () {},
              child: Text('Go to second screen'),
            ),
          ],
        )),
      ),
    );
  }
}
