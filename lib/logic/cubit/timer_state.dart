part of 'timer_cubit.dart';

abstract class TimerState extends Equatable {}

class TimerIdle extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerBusy extends TimerState {
  @override
  List<Object?> get props => [];
}
