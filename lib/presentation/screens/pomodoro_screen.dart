import 'package:bloc_count_down_timer/logic/cubit/count_down_timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff1542bf),
            Color.fromARGB(255, 23, 47, 114),
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
                  child: Center(
                    child: MaterialButton(
                      color: Colors.blueGrey,
                      onPressed: (() {
                        context
                            .read<CountDownTimerCubit>()
                            .startSecondsTimer(seconds: 10);
                      }),
                      child: const Text(
                        'Click Here To Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
