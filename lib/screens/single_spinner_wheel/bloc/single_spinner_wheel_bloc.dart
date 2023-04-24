import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_spinner_wheel_event.dart';
part 'single_spinner_wheel_state.dart';

class SingleSpinnerWheelBloc extends Bloc<SingleSpinnerWheelEvent, SingleSpinnerWheelState> {
  SingleSpinnerWheelBloc() : super(SingleSpinnerWheelInitial()) {
    on<SingleSpinnerWheelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
