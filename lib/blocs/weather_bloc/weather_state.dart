part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class Loading extends WeatherState {}

class SuccessResult extends WeatherInitial {
  final List<Weather> weatherData;

  SuccessResult({required this.weatherData});
}

class FailureResult extends WeatherState {
  final String message;

  FailureResult({required this.message});
}
