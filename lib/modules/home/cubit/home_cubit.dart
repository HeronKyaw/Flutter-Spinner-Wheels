import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);
  
  void changeIndex(int index) {
    emit(index);
  }
}
