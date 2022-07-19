import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'count_down_timer_state.dart';

class CountDownTimerCubit extends Cubit<CountDownTimerState> {
  late Timer secondsTimer;

  CountDownTimerCubit()
      : super(const CountDownTimerState(
          timeinsecond: 0,
          percent: 0.0,
        ));

  void startSecondsTimer({required int seconds}) {
    int maxSeconds = seconds;
    secondsTimer = Timer.periodic(const Duration(seconds: 1), ((_) {
      if (seconds >= 0) {
        emit(CountDownTimerState(
          timeinsecond: seconds,
          percent: seconds / maxSeconds,
        ));
        seconds--;
      } else {
        secondsTimer.cancel();
      }
    }));
  }
}
