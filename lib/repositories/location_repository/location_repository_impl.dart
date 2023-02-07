import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/config/api_config.dart';
import 'package:weather_app/exceptions/api_exception.dart';
import 'package:weather_app/exceptions/geolocation_exception.dart';
import 'package:weather_app/exceptions/validation_exception.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/repositories/location_repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Dio dio;

  LocationRepositoryImpl({required this.dio});

  @override
  Future<Location> getCityGeolocation({required String city}) async {
    if (city.isEmpty) {
      throw ValidationException();
    }

    Response response = await dio.get(
      Uri.parse(
        ApiConfig.geolocationEndpoint,
      ).toString(),
      queryParameters: {
        'q': city,
        'limit': 1,
        'appid': ApiConfig.apiKey,
      },
    );

    int? responseCode = response.statusCode;
    if (responseCode == null || responseCode != 200) {
      throw ApiException();
    }

    List<dynamic>? responseBody = response.data;
    if (responseBody == null || responseBody.isEmpty) {
      throw ApiException();
    }

    return Location(
      lat: responseBody.first['lat'],
      lon: responseBody.first['lon'],
    );
  }

  @override
  Future<Location> getCurrentLocation() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      LocationPermission locationPermission =
          await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        throw GeolocatorException();
      }
    }
    Position currentPosition = await Geolocator.getCurrentPosition();
    return Location(
      lat: currentPosition.latitude,
      lon: currentPosition.longitude,
    );
  }
}
