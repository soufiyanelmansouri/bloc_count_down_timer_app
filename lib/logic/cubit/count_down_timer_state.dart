// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'count_down_timer_cubit.dart';

class CountDownTimerState extends Equatable {
  final int timeinsecond;
  final double percent;
  const CountDownTimerState({
    required this.timeinsecond,
    required this.percent,
  });

  @override
  List<Object?> get props => [timeinsecond, percent];
}
