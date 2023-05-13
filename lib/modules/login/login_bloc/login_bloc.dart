import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SpinnerWheelRepository _spinnerWheelRepository;
  LoginBloc(this._spinnerWheelRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
    });
    on<LoginButtonPressed>(_loginButtonPressed);
    on<LogoutButtonPressed>(_logoutButtonPressed);
    on<RememberMeButtonChecked>(_rememberMeButtonChecked);
  }

  FutureOr<void> _loginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async{
    try {
      var credential = await _spinnerWheelRepository.signIn(event.username, event.password);
      if (credential != null) {
        emit(const LoginSuccess());
      } else {
        emit(const LoginFailure('Login Failed'));
      }
    } catch (error) {
      emit(LoginFailure('Error: $error'));
    }
  }

  FutureOr<void> _logoutButtonPressed(LogoutButtonPressed event, Emitter<LoginState> emit) async{
    try {
      await _spinnerWheelRepository.logout();
      emit(const LogoutSuccess());
    } catch (error) {
      emit(LogoutFailure('Error: $error'));
    }
  }

  FutureOr<void> _rememberMeButtonChecked(RememberMeButtonChecked event, Emitter<LoginState> emit) {
    bool checked = event.isChecked;
    bool reverseChecked = checked ? false : true;
    emit(CheckedRememberMe(reverseChecked));
  }
}
