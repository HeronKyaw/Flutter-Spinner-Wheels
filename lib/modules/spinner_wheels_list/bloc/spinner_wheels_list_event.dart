part of 'spinner_wheels_list_bloc.dart';

abstract class SpinnerWheelsListEvent extends Equatable {
  const SpinnerWheelsListEvent();

  @override
  List<Object> get props => [];
}

class AddNewWheel extends SpinnerWheelsListEvent {
  const AddNewWheel();
}

class ClickWheel extends SpinnerWheelsListEvent {
  const ClickWheel();
}

