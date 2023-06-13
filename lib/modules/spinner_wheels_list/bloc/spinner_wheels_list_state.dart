part of 'spinner_wheels_list_bloc.dart';

abstract class SpinnerWheelsListState extends Equatable {
  const SpinnerWheelsListState();
  
  @override
  List<Object> get props => [];
}

class SpinnerWheelsListInitial extends SpinnerWheelsListState {}

class SpinnerWheelsListLoading extends SpinnerWheelsListState {}

class SpinnerWheelsListLoaded extends SpinnerWheelsListState {
  final List<SpinnerWheel> spinnerWheelsList;

  const SpinnerWheelsListLoaded({required this.spinnerWheelsList});

  @override
  List<Object> get props => [spinnerWheelsList];
}

class AddNewWheelSuccess extends SpinnerWheelsListState {}

class DeleteNewWheelSuccess extends SpinnerWheelsListState {}