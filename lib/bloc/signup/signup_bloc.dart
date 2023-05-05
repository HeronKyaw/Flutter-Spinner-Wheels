import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SpinnerWheelRepository _spinnerWheelRepository;
  SignupBloc(this._spinnerWheelRepository) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
    });
    on<SignupButtonPressed>(_signupButtonPressed);
  }

  FutureOr<void> _signupButtonPressed(SignupButtonPressed event, Emitter<SignupState> emit) async {
    try {
      if (event.password == event.confirmPassword) {
        emit(const PasswordValidate());

        if (state is PasswordValidate) {
          await _spinnerWheelRepository.signUp(event.email, event.password);
        } else {
          emit(const SignupFailure('Password does not match.'));
        }
      } else {
        emit(const PasswordValidateFailure("Password does not match."));
      }
    } catch (error){
      emit(SignupFailure('Error: $error'));
    }
  }
}
