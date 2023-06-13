import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';

part 'single_spinner_wheel_event.dart';
part 'single_spinner_wheel_state.dart';

class SingleSpinnerWheelBloc extends Bloc<SingleSpinnerWheelEvent, SingleSpinnerWheelState> {
  final SpinnerWheelRepository _spinnerWheelRepository;
  SingleSpinnerWheelBloc(this._spinnerWheelRepository) : super(SingleSpinnerWheelInitial()) {
    on<SingleSpinnerWheelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
