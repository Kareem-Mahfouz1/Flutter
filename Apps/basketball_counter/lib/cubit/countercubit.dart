import 'package:basketball_counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrementState());

  int teamAPoints = 0;
  int teamBPoints = 0;

  void incrementTeamA(int value) {
    teamAPoints += value;
    emit(CounterAIncrementState());
  }

  void incrementTeamB(int value) {
    teamBPoints += value;
    emit(CounterBIncrementState());
  }
}
