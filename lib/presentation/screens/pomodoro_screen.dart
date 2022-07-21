import 'package:bloc_count_down_timer/logic/cubit/count_down_timer_cubit.dart';
import 'package:bloc_count_down_timer/logic/cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../widgets/buttons.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 41, 52, 84),
            Color.fromARGB(255, 91, 115, 181),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: BlocBuilder<CountDownTimerCubit, CountDownTimerState>(
                builder: (context, bloc) => CircularPercentIndicator(
                  animationDuration: 1000,
                  percent: bloc.percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 100,
                  lineWidth: 10,
                  progressColor: Colors.white,
                  center: Text(
                    '${bloc.timeinsecond}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              )),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                          title: 'Start',
                          call: () {
                            BlocProvider.of<CountDownTimerCubit>(context)
                                .startSecondsTimer(seconds: 10);
                          }),
                      BlocBuilder<TimerCubit, TimerState>(
                        builder: (bloc, state) {
                          return Button(
                              title: state is TimerIdle ? 'Pause' : 'Resume',
                              call: () {
                                bloc.read<TimerCubit>().pauseTheTimer();
                              });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
