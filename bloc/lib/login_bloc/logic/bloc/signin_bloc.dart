import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/login_bloc/models/data_model.dart';
import 'package:bloc_tut/login_bloc/repo/login_repo.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SinginRepo signinRepo;
  SigninBloc(this.signinRepo) : super(SigninInitial());

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is UserSignIn) {
      yield LoadingState();
      try {
        DataModel data =
            await signinRepo.signInuser(event._email, event._password);
        yield LoadedState(data);
      } catch (error) {
        print('erros is: $error');
        yield ErrorState();
      }
    } else if (event is LogoutUser) {
      await signinRepo.logoutUser();
      yield SigninInitial();
    }
  }
}
