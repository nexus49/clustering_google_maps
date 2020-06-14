import 'package:google_maps_flutter/google_maps_flutter.dart';


class AggregatedPoints {
  final LatLng location;
  final int count;
  String bitmabAssetName;

  AggregatedPoints(this.location, this.count) {
    this.bitmabAssetName = getBitmapDescriptor();
  }

  AggregatedPoints.fromMap(
      Map<String, dynamic> map, String dbLatColumn, String dbLongColumn)
      : count = map['n_marker'],
        this.location = LatLng(map['lat'], map['long']) {
    this.bitmabAssetName = getBitmapDescriptor();
  }

  String getBitmapDescriptor() {
    String bitmapDescriptor;
    if (count < 10) {
      // + 2
      bitmapDescriptor = "assets/m1.png";
    } else if (count < 25) {
      // + 10
      bitmapDescriptor = "assets/m2.png";
    } else if (count < 50) {
      // + 25
      bitmapDescriptor = "assets/m3.png";
    } else if (count < 100) {
      // + 50
      bitmapDescriptor = "assets/m4.png";
    } else if (count < 500) {
      // + 100
      bitmapDescriptor = "assets/m5.png";
    } else if (count < 1000) {
      // +500
      bitmapDescriptor = "assets/m6.png";
    } else {
      // + 1k
      bitmapDescriptor = "assets/m7.png";
    }
    return bitmapDescriptor;
  }

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_$count";
  }
}
