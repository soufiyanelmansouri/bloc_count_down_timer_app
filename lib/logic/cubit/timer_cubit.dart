import 'package:bloc/bloc.dart';
import 'package:bloc_count_down_timer/logic/cubit/count_down_timer_cubit.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  CountDownTimerCubit countDownTimerCubit;
  TimerCubit(this.countDownTimerCubit) : super(TimerIdle());

  void pauseTheTimer() {
    if (state is TimerIdle) {
      countDownTimerCubit.secondsTimer.cancel();
      emit(TimerBusy());
    } else {
      emit(TimerIdle());
      countDownTimerCubit.startSecondsTimer(
          seconds: countDownTimerCubit.state.timeinsecond);
    }
  }
}
