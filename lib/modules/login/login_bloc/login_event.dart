part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed(
      {required this.username,
      required this.password});

  @override
  List<Object?> get props => [username, password];
}

class LogoutButtonPressed extends LoginEvent {
  const LogoutButtonPressed();
}

class RememberMeButtonChecked extends LoginEvent {
  final bool isChecked;
  const RememberMeButtonChecked({required this.isChecked});

  @override
  List<Object?> get props => [isChecked]; 
}