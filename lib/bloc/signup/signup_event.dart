part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const SignupButtonPressed({required this.email, required this.password, required this.confirmPassword});

  @override
  List<Object> get props => [password, email];
}
