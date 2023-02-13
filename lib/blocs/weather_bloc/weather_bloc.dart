import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/exceptions/api_exception.dart';
import 'package:weather_app/exceptions/geolocation_exception.dart';
import 'package:weather_app/exceptions/validation_exception.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/location_repository/location_repository.dart';
import 'package:weather_app/repositories/weather_repository/weather_repository.dart';

import '../../models/location.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final LocationRepository locationRepository;
  final WeatherRepository weatherRepository;

  WeatherBloc({
    required this.locationRepository,
    required this.weatherRepository,
  }) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      emit(Loading());
      try {
        Location? location;
        if (event is GetWeatherByPlace) {
          location =
              await locationRepository.getCityGeolocation(city: event.city);
        } else if (event is GetWeatherByCurrentPosition) {
          location = await locationRepository.getCurrentLocation();
        }

        List<Weather> weatherData =
            await weatherRepository.getWeatherData(location: location!);

        emit(SuccessResult(weatherData: weatherData));
      } catch (exception) {
        String exceptionMessage =
            'Could not get information about weather, try it again later or restart the application';
        if (exception is ApiException) {
          exceptionMessage =
              'Could not get weather data in this place, check whether eneterd place is valid';
        } else if (exception is GeolocatorException) {
          exceptionMessage =
              'Could not get data of your current location, check whether location is enabled';
        } else if (exception is ValidationException) {
          exceptionMessage = 'Entered value must not be empty';
        }

        emit(FailureResult(message: exceptionMessage));
      }
    });
  }
}
