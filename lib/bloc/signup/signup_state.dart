part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupSuccess extends SignupState {
  const SignupSuccess();
}

class SignupFailure extends SignupState {
  final String error;

  const SignupFailure(this.error);

  @override
  List<Object> get props => [error];
}

class PasswordValidate extends SignupState {
  const PasswordValidate();
}

class PasswordValidateFailure extends SignupState {
  final String error;

  const PasswordValidateFailure(this.error);

  @override
  List<Object> get props => [error];
}