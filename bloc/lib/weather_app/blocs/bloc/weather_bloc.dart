import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/weather_app/models/data_model.dart';
import 'package:bloc_tut/weather_app/models/data_model.dart';
import 'package:bloc_tut/weather_app/models/data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import '../../repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // we need to pass the repository to which this bloc is linked
  WeatherRepo weatherRepo;
  WeatherBloc(this.weatherRepo) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        DataModel data = await weatherRepo.getWeather(event._city);
        print('data: ${data.lastUpdated.toString()}');
        yield WeatherLoaded(data);
      } catch (error) {
        print('$error');
        yield WeatherNotLoaded();
      }
    } else if (event is ResetWeather) {
      yield WeatherInitial();
    }
  }
}
