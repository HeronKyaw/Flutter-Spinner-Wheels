part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeIndex extends HomeState {
  final int index;

  const HomeIndex(this.index);

  @override
  List<Object> get props => [index];
}