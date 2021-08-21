import 'package:flutter/material.dart';
import 'package:location_flutter/map/myMap.dart';
import 'package:location_flutter/services/geo_locator_service.dart';
import 'package:provider/provider.dart';

final geolocator = GeolocatorService();


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>geolocator)
      ],child: MyHomeMap(),)
    );
  }
}

