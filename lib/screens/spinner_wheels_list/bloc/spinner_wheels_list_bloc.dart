import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'spinner_wheels_list_event.dart';
part 'spinner_wheels_list_state.dart';

class SpinnerWheelsListBloc extends Bloc<SpinnerWheelsListEvent, SpinnerWheelsListState> {
  SpinnerWheelsListBloc() : super(SpinnerWheelsListInitial()) {
    on<SpinnerWheelsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
