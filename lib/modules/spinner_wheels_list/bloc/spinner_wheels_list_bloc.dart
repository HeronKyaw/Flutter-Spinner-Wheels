import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/models/spinner_wheel_model.dart';

part 'spinner_wheels_list_event.dart';
part 'spinner_wheels_list_state.dart';

class SpinnerWheelsListBloc extends Bloc<SpinnerWheelsListEvent, SpinnerWheelsListState> {
  final SpinnerWheelRepository _spinnerWheelRepository;
  SpinnerWheelsListBloc(this._spinnerWheelRepository) : super(SpinnerWheelsListInitial()) {
    on<SpinnerWheelsListEvent>((event, emit) {
    });
    on<AddNewWheel> ((event, emit) {
      
    });
  }
}
