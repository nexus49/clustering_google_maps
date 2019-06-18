import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geohash/geohash.dart';

class LatLngAndGeohash {
  final LatLng location;
  String geohash;
  // Property to  hold any number of additional data elements retrieved from the db.
  Map<String, dynamic> data;

  LatLngAndGeohash(this.location) {
    geohash = Geohash.encode(location.latitude, location.longitude);
  }

  LatLngAndGeohash.fromMap(Map<String, dynamic> map)
      : location = LatLng(map['lat'], map['long']) {
    this.geohash =
        Geohash.encode(this.location.latitude, this.location.longitude);
    this.data = map;
  }

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_${Random().nextInt(10000)}";
  }
}
