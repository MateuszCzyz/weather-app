import '../../models/location.dart';

abstract class LocationRepository {
  Future<Location> getCurrentLocation();
  Future<Location> getCityGeolocation({required String city});
}
