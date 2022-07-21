import 'dart:async';
import 'package:bloc_count_down_timer/logic/cubit/count_down_timer_cubit.dart';
import 'package:bloc_count_down_timer/logic/cubit/timer_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TimerCubit sut;
  late CountDownTimerCubit countDownTimerCubit;
  setUp(() {
    countDownTimerCubit = CountDownTimerCubit();
    sut = TimerCubit(countDownTimerCubit);
  });

  group('Timer Cubit', () {
    test("Test initial values", () {
      expect(sut.state, TimerIdle());
    });
    test('Testing pauseTheTimer method', () async {
      countDownTimerCubit.secondsTimer =
          Timer.periodic(const Duration(seconds: 0), ((timer) {}));
      sut.pauseTheTimer();
      expect(sut.state, TimerBusy());
      sut.pauseTheTimer();
      expect(sut.state, TimerIdle());
    });
  });
}
