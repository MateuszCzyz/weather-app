part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherByPlace extends WeatherEvent {
  final String city;

  GetWeatherByPlace({required this.city});
}

class GetWeatherByCurrentPosition extends WeatherEvent {}
