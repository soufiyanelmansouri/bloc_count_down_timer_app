import 'package:bloc_count_down_timer/logic/cubit/count_down_timer_cubit.dart';
import 'package:bloc_count_down_timer/presentation/screens/pomodoro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountDownTimerCubit>(
      create: (context) => CountDownTimerCubit(),
      child: const MaterialApp(
        title: 'Pomodoro',
        debugShowCheckedModeBanner: false,
        home: Pomodoro(),
      ),
    );
  }
}
