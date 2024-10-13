import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/WeatherCubit.dart';
import 'package:weatherapp/Page/homePage.dart';
import 'package:weatherapp/services/weatherService.dart';

void main() {
  runApp(BlocProvider<WeatherCubit>(
      create: (context) {
        return WeatherCubit(weatherService());
      },
      child: const weatherApp()));
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
