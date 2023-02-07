part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class Loading extends WeatherState {}

class SuccessResult extends WeatherInitial {
  final List<Weather> weatherData;
  final List<Pollution> pollutionData;

  SuccessResult({required this.weatherData, required this.pollutionData});
}

class FailureResult extends WeatherState {
  final String message;

  FailureResult({required this.message});
}
