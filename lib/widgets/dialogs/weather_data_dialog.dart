import 'package:flutter/material.dart';
import 'package:weather_app/models/pollution.dart';
import 'package:weather_app/models/weather.dart';

class WeatherDataDialog extends StatelessWidget {
  final List<Weather> weatherData;
  final List<Pollution> pollutionData;

  const WeatherDataDialog(
      {super.key, required this.weatherData, required this.pollutionData});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(title: Text("Successfully fetched data :)"));
  }
}
