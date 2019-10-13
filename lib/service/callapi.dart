import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uiflutterjubertaxi/model/geoobj.dart';
import 'package:uiflutterjubertaxi/model/placeitem.dart';
import '../uidata.dart';


class CallApi {
  CallApi();

  Future<List<Results>> searchPlace(String keyword) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=" +
           UIData.keySearchMap+
            "&language=vi&region=VN&query=" +
            Uri.encodeQueryComponent(keyword);

    print("search >>: " + url);
    var res = await http.get(url);
    print("res "+ json.decode(res.body).toString());
        if (res.statusCode == 200) {
          PlaceItemRes placeItemRes = PlaceItemRes.fromJson(json.decode(res.body));
      return placeItemRes.results;
    } else {
      return new List();
    }
  }

  Future<String> findnameplace(String lat1,String long1) async {
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?key=" +
            UIData.keyGeoMap+
            "&latlng=" + lat1 + "," + long1;


    print("findnameplace >>: " + url);
    var res = await http.get(url);
    print("res "+ json.decode(res.body).toString());
    if (res.statusCode == 200) {
      Geoobj geoobj = Geoobj.fromJson(json.decode(res.body));
      return geoobj.results[0].formattedAddress;
    } else {
      return "";
    }
  }
}