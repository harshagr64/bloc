import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/constants/enum.dart';
import 'package:bloc_tut/logic/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;
  // not used in many cases
  // StreamSubscription connectivityStreamSubscription;
  
  CounterCubit()
      : super(CounterState(counterValue: 0)) {
    // not used in many cases
    // connectivityStreamSubscription = internetCubit.stream.listen((internetState) {
    //   if (internetState is InternetConnected &&
    //       internetState.connectionType == ConnectionType.Wifi) {
    //     increment();
    //   } else if (internetState is InternetConnected &&
    //       internetState.connectionType == ConnectionType.Wifi) {
    //     decrement();
    //   }
    // });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  // @override
  // Future<void> close() {
  //   connectivityStreamSubscription.cancel();
  //   return super.close();
  // }
}
