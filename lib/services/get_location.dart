import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_flutter/models/get_direction.dart';
import 'package:location_flutter/utils/constant.dart';

class LocationService {
    static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  LocationService({Dio dio}) : _dio = dio ?? Dio();

  Future<GetDirection> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': AppConstant.apikey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      print(response);
      return GetDirection.fromMap(response.data);
    }
    return null;
  }
}