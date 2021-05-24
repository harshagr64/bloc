part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class UserSignIn extends SigninEvent {
  final String _email;
  final String _password;

  UserSignIn(this._email, this._password);

  @override
  List<Object> get props => [_email, _password];
}

class LogoutUser extends SigninEvent {}
