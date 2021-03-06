import 'dart:async';

enum CounterAction {
  Increament,
  Decreament,
  Reset,
}

class CounterBloc {
  int counter;
  final _stateStreamController = StreamController<int>.broadcast();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>.broadcast();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.Increament)
        counter++;
      else if (event == CounterAction.Decreament)
        counter--;
      else if (event == CounterAction.Reset) counter = 0;

      counterSink.add(counter);
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
