part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final DataModel _dataModel;

  DataModel get dataModel => _dataModel;

  WeatherLoaded(this._dataModel);

  @override
  List<Object> get props => [_dataModel];
}

class WeatherNotLoaded extends WeatherState {}
