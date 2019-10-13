import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Placeobj {
  String placename;
  LatLng placeLatlng;

  Placeobj({this.placename, this.placeLatlng});

  Placeobj.fromJson(Map<String, dynamic> json) {    
    this.placename = json['placename'];
    this.placeLatlng = json['placeLatlng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placename'] = this.placename;
    data['placeLatlng'] = this.placeLatlng;
    return data;
  }

}

class PLacesList{
  Placeobj pick;
  Placeobj dest;
}