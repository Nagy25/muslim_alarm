import 'package:geolocator/geolocator.dart';

abstract class LocationService {
  Future<Position> getCurrentPosition();
}

class LocationServiceImp implements LocationService {
  @override
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (!serviceEnabled) {
      final position = await Geolocator.getLastKnownPosition();
      if (position != null) {
        return position;
      }
      return Future.error('Location services are disabled.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
