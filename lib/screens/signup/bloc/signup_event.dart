part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final String password;
  final String email;

  const SignupButtonPressed({required this.password, required this.email});

  @override
  List<Object> get props => [password, email];
}
