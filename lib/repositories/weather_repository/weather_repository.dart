import 'package:weather_app/models/pollution.dart';
import 'package:weather_app/models/weather.dart';

import '../../models/location.dart';

abstract class WeatherRepository {
  Future<List<Weather>> getWeatherData({required Location location});
  Future<List<Pollution>> getPollutionData({required Location location});
}
