import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }

  FutureOr<void> _loginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async{
    try {
      await _spinnerWheelRepository.signIn(event.username, event.password);
      emit(const LoginSuccess());
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
}
