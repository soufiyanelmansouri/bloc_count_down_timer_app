import 'package:bloc_count_down_timer/logic/cubit/count_down_timer_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CountDownTimerCubit sut;
  setUp(() {
    sut = CountDownTimerCubit();
  });

  group('CountDownTimerCubit', () {
    test("Test initial values", () {
      expect(
          sut.state,
          const CountDownTimerState(
            timeinsecond: 0,
            percent: 0.0,
          ));
    });

    test('Testing the startSecondsTimer method', () async {
      sut.startSecondsTimer(seconds: 1);
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(
          sut.state, const CountDownTimerState(percent: 0.0, timeinsecond: 0));
    });
  });
}
