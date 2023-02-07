import 'package:dio/dio.dart';
import 'package:weather_app/config/api_config.dart';
import 'package:weather_app/exceptions/api_exception.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/pollution.dart';
import 'package:weather_app/models/weather.dart';

import './weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final Dio dio;

  WeatherRepositoryImpl({required this.dio});

  @override
  Future<List<Pollution>> getPollutionData({required Location location}) async {
    Response response = await dio.get(
        Uri.parse(ApiConfig.pollutionEndpoit).toString(),
        queryParameters: {
          'lat': location.lat,
          'lon': location.lon,
          'units': 'metric',
          'appid': ApiConfig.apiKey
        });

    if (response.statusCode == null || response.statusCode != 200) {
      throw ApiException();
    }

    List<Pollution> pollutionData = <Pollution>[];
    return pollutionData;
  }

  @override
  Future<List<Weather>> getWeatherData({required Location location}) async {
    Response response = await dio
        .get(Uri.parse(ApiConfig.weatherEndpoint).toString(), queryParameters: {
      'lat': location.lat,
      'lon': location.lon,
      'units': 'metric',
      'appid': ApiConfig.apiKey,
    });

    if (response.statusCode == null || response.statusCode != 200) {
      throw ApiException();
    }

    List<Weather> weatherData = <Weather>[];
    String weatherPlace = response.data['city']['name'];
    response.data['list'].forEach(
      (data) => {
        weatherData.add(
          Weather(
            place: weatherPlace,
            description: data['weather'][0]['description'],
            timestamp: data['dt'],
            temperature: data['main']['temp'],
            pressure: data['main']['pressure'],
            icon: data['weather'][0]['icon'],
          ),
        ),
      },
    );

    return weatherData;
  }
}
