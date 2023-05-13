part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class LogoutSuccess extends LoginState {
  const LogoutSuccess();
}

class LogoutFailure extends LoginState {
  final String error;
  const LogoutFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class CheckedRememberMe extends LoginState {
  final bool isChecked;
  const CheckedRememberMe(this.isChecked);

  @override
  List<Object?> get props => [isChecked];
}
