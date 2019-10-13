import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uiflutterjubertaxi/model/placeobj.dart';
import 'package:uiflutterjubertaxi/page/favorite.dart';
import 'package:uiflutterjubertaxi/page/loginsignup.dart';
import 'package:uiflutterjubertaxi/page/myride.dart';
import 'package:uiflutterjubertaxi/page/notifacation.dart';
import 'package:uiflutterjubertaxi/page/promo.dart';
import 'package:uiflutterjubertaxi/page/support.dart';
import 'package:uiflutterjubertaxi/service/callapi.dart';
import 'package:uiflutterjubertaxi/uidata.dart';
import 'package:uiflutterjubertaxi/widget/clipper.dart';
import 'package:uiflutterjubertaxi/widget/loader2.dart';

import 'payment.dart';
import 'selectdestination.dart';

import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _MyTabmapScreenState createState() => _MyTabmapScreenState();
}

class _MyTabmapScreenState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  LatLng _center = const LatLng(10.020909, 105.786489);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = const LatLng(10.020909, 105.786489);

  Geolocator _geolocator;
  Position _position;
  LatLng _positioncar1;
  String diachihinetai = "";
  var isLoading = true;
  final CallApi _callApi = new CallApi();

  final myController1 = TextEditingController();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();
    LocationOptions locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    checkPermission();
    updateLocation();

    StreamSubscription positionStream = _geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      _position = position;
    });
  }

  void updateLocation() async {
    try {
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      setState(() {
        _position = newPosition;

        _center = LatLng(newPosition.latitude, newPosition.longitude);
        _lastMapPosition = _center;
        double lat = newPosition.latitude + 0.1;
        _positioncar1 = LatLng(lat, newPosition.longitude);
      });
      print("lat:" + _position.latitude.toString());
      print("long:" + _position.longitude.toString());
      searchPlace();
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  Future searchPlace() async {
    print("searchPlace....");
    String diachi = await _callApi.findnameplace(
        _position.latitude.toString(), _position.longitude.toString());
    setState(() {
      diachihinetai = diachi;
      isLoading = false;
      myController1.text = diachi;
    });
    print("diachihinetai:" + diachihinetai);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: diachihinetai,
          //snippet: 'Đánh giá: 5*',
        ),
        icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.fromAsset("assets/images/car.png"),
      ));

      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,

        //icon: BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromAsset("assets/images/caricon1.png"),
      ));
    });
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  _buildDrawer() {
    final String image = 'assets/images/user.jpeg';
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: UIData.PrimaryColor,
                      ),
                      onPressed: () {
                        _xacnhanthoat();
                      },
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: UIData.PrimaryColor,
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: ExactAssetImage(image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "TRINH XUAN NHI",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "+84.939 xxx xxx",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Mdi.history, "Booking", goid: 1),
                  _buildDivider(),
                  _buildRow(Mdi.decagramOutline, "Promotion", goid: 2),
                  _buildDivider(),
                  _buildRow(Mdi.heartOutline, "My favorites", goid: 3),
                  _buildDivider(),
//                  _buildRow(Mdi.bellOutline, "Notifications",
//                      showBadge: true),

                  _buildRow(Mdi.creditCardOutline, "My payment", goid: 4),
                  _buildDivider(),
                  _buildRow(Mdi.bellOutline, "Notification",
                      showBadge: true, goid: 5),
                  _buildDivider(),
                  _buildRow(Icons.headset, "Support", goid: 6),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title,
      {bool showBadge = false, int goid}) {
    final TextStyle tStyle =
        TextStyle(color: active, fontSize: 16.0, fontWeight: FontWeight.bold);
    return InkWell(
      onTap: () => {_goto(goid)},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Icon(
            icon,
            //color: active,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
          if (showBadge)
            Material(
              color: UIData.PrimaryColor,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: UIData.PrimaryColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  "3",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 1),
      child: IconButton(
        icon: new Icon(
          Icons.menu,
          color: UIData.PrimaryColor,
          size: 32,
        ),
        onPressed: () {
          _key.currentState.openDrawer();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        drawer: _buildDrawer(),
        body: Stack(
          children: <Widget>[
            isLoading
                ? Center(child: LoaderTwo())
                : GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 18.0,
                    ),
                    markers: _markers,
                  ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                      padding: const EdgeInsets.all(22.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: myController1,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.my_location,
                                  color: UIData.Bassic,
                                ),
                                hintText: "Pick me at",
                                hintStyle: TextStyle(color: Colors.black26),
                                //filled: true,
                                //fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey, width: 5.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 16.0)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onTap: () {
                              _showselectpage();
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: UIData.PrimaryColor,
                                ),
                                hintText: "Enter Destination",
                                hintStyle: TextStyle(color: Colors.black26),
                                //filled: true,
                                //fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey, width: 5.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 16.0)),
                          )
                        ],
                      )),
                ],
              ),
            ),
            _buildTop(),
          ],
        ),
      ),
    );
  }

  _showselectpage() {
    print("click");
    LatLng pick = LatLng(_position.latitude, _position.longitude);
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return SelectDesPage(
          placepickobj:
              new Placeobj(placename: diachihinetai, placeLatlng: pick));
    }));
  }

  _goto(int goid) {
    print("go ${goid}");
    Navigator.of(context).pop(); //close drawer
    switch (goid) {
      case 1:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return MyRidePage();
          }));
        }
        break;
      case 2:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return PromoPage();
          }));
        }
        break;
      case 3:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return FavoritePage();
          }));
        }
        break;
      case 4:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return PaymementPage();
          }));
        }
        break;
      case 5:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return NotificationPage();
          }));
        }
        break;
      case 6:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return SupportPage();
          }));
        }
        break;
    }
  }

  void _xacnhanthoat() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "SIGN OUT",
      desc: "Are you sure?",
      buttons: [
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: UIData.PrimaryColor, fontSize: 20),
          ),
          onPressed: () => {
            Navigator.pop(context),
            Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (context) {
              return LoginSignupPage();
            }))
          },
          color: Colors.black12,
        ),
        DialogButton(
            child: Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: UIData.PrimaryColor),
      ],
    ).show();
  }
}
