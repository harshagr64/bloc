part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class SigninInitial extends SigninState {}

class LoadingState extends SigninState {}

class LoadedState extends SigninState { 
  final DataModel _dataModel;
  DataModel get dataModel => _dataModel;
  LoadedState(this._dataModel);

  @override
  // TODO: implement props
  List<Object> get props => [_dataModel];
}

class ErrorState extends SigninState {}

