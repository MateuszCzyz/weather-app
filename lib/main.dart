import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_theme.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/repositories/location_repository/location_repository.dart';
import 'package:weather_app/repositories/location_repository/location_repository_impl.dart';
import 'package:weather_app/repositories/weather_repository/weather_repository.dart';
import 'package:weather_app/repositories/weather_repository/weather_repository_impl.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LocationRepository locationRepository = LocationRepositoryImpl(
    dio: Dio(),
  );
  final WeatherRepository weatherRepository = WeatherRepositoryImpl(
    dio: Dio(),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(
        locationRepository: locationRepository,
        weatherRepository: weatherRepository,
      ),
      child: MaterialApp(
        theme: appTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
