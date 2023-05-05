import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_spinner_wheel_event.dart';
part 'current_spinner_wheel_state.dart';

class CurrentSpinnerWheelBloc extends Bloc<CurrentSpinnerWheelEvent, CurrentSpinnerWheelState> {
  CurrentSpinnerWheelBloc() : super(CurrentSpinnerWheelInitial()) {
    on<CurrentSpinnerWheelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
