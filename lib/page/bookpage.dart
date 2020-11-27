import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:swipe_button/swipe_button.dart';
import 'package:uiflutterjubertaxi/model/placeobj.dart';
import 'package:uiflutterjubertaxi/page/rating.dart';

import 'package:uiflutterjubertaxi/service/callapi.dart';
import 'package:uiflutterjubertaxi/uidata.dart';
import 'package:uiflutterjubertaxi/widget/loader2.dart';

import 'chat.dart';
import 'drivercomming.dart';
import 'promo.dart';
import 'selectdestination.dart';

import 'package:geolocator/geolocator.dart';

class BookingPage extends StatefulWidget {
  final PLacesList pLacesList;

  const BookingPage({Key key, this.pLacesList}) : super(key: key);

  @override
  _MyTabmapScreenState createState() => _MyTabmapScreenState();
}

class _MyTabmapScreenState extends State<BookingPage> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  bool isCar = false;
  int trangthai = 0;

  LatLng _from = const LatLng(10.0244244, 105.7562064); //home
  LatLng _to = const LatLng(10.020909, 105.786489); //work

  LatLng _center = const LatLng(10.020909, 105.786489);
  final Set<Marker> _markers = {};
  //LatLng _lastMapPosition = const LatLng(10.020909, 105.786489);

  int _polylineCount = 1;
  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
  GoogleMapPolyline _googleMapPolyline =
      new GoogleMapPolyline(apiKey: UIData.keyDirectionMap);

  //Polyline patterns
  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[], //line
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)], //dash
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)], //dot
    <PatternItem>[
      //dash-dot
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
  ];
  //Get polyline with Location (latitude and longitude)
  _getPolylinesWithLocation() async {
    //_setLoadingMenu(true);
    List<LatLng> _coordinates =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _from, destination: _to, mode: RouteMode.driving);

    setState(() {
      _polylines.clear();
    });
    _addPolyline(_coordinates);
    //_setLoadingMenu(false);
  }

  _addPolyline(List<LatLng> _coordinates) {
    PolylineId id = PolylineId("poly$_polylineCount");
    Polyline polyline = Polyline(
        polylineId: id,
        patterns: patterns[0],
        color: UIData.PrimaryColor,
        points: _coordinates,
        width: 5,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
      _polylineCount++;
    });
  }

  Geolocator _geolocator;
  Position _position;
  String diachihinetai = "";
  var isLoading = false;
  final CallApi _callApi = new CallApi();

  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              trangthai = 2;
              startTimerOnRun();
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  //dung cho Process Bar -> show rating
  Timer _timerOnrun;
  int _startrun = 50;
  double phantram=0.0;

  void startTimerOnRun() {
    const oneSec = const Duration(seconds: 1);
    _timerOnrun = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_startrun < 5) {
            timer.cancel();
            Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (context) {
              return RatingPage();
            }));
          } else {
            _startrun = _startrun - 1;
            phantram=phantram+0.02;
          }
        },
      ),
    );
  }


  @override
  void dispose() {
    _timer.cancel();
    _timerOnrun.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();
    LocationOptions locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

      setState(() {
        _from = widget.pLacesList.pick.placeLatlng;
        _to = widget.pLacesList.dest.placeLatlng;
        _center = widget.pLacesList.dest.placeLatlng;
      });
    _getPolylinesWithLocation();

    print("from ${widget.pLacesList.pick.placename}");
    print("to ${widget.pLacesList.dest.placename}");
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_center.toString()),
        position: _center,
        infoWindow: InfoWindow(
          title: diachihinetai,
          //snippet: 'Đánh giá: 5*',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });
  }

  Widget _bildBackbtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: IconButton(
        icon: new Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _builtTop() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        //color: Colors.green,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    widget.pLacesList.pick.placename,
                    maxLines: 1,
                  ),
                  leading: Icon(
                    Icons.my_location,
                    color: UIData.Bassic,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(widget.pLacesList.dest.placename, maxLines: 1),
                  leading: Icon(
                    Icons.location_on,
                    color: UIData.PrimaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTrangthaiBooking() {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            isCar ? _buildCar1() : _buildCar2(),
            isCar ? _buildBike2() : _buildBike1(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      Text(
                        "Cash Payment",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _showpromopage(),
                    child: Text(
                      "Promo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                color: UIData.PrimaryColor,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    trangthai = 1;
                  });
                  startTimer();
                },
                child: Text(
                  "BOOK NOW",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildTrangthaiWaiting() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Column(children: <Widget>[
          LoaderTwo(),
          Text(
            "WE ARE PROCESSING YOUR BOOKING",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Your ride will start soon ${_start}s"),
          ),
          SwipeButton(
            thumb: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                    widthFactor: 0.50,
                    child: Icon(
                      Icons.chevron_right,
                      size: 32.0,
                      color: Colors.white,
                    )),
              ],
            ),
            content: Center(
              child: Text(
                "SLIDE TO CANCEL",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            onChanged: (result) {
              print("cancel");
              setState(() {
                trangthai = 0;
                _timer.cancel();
              });
            },
          ),
        ]));
  }

  Widget _buildFounddriver() {
    return InkWell(
      onTap: () => {_gotodrivercomming()},
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: Column(children: <Widget>[
            Text("WE FOUND YOU A DRIVER"),
            Text(
              "Driver will pickup you at 07:00",
              style: TextStyle(color: UIData.PrimaryColor),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return RatingPage();
                      }));
                    },
                    child: new Icon(
                      Mdi.phoneOutline,
                      color: Colors.green,
                      size: 18.0,
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage(
                        'assets/images/driver.jpeg',
                      ),
                      minRadius: 90,
                      maxRadius: 150,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return ChatTwoPage();
                      }));
                    },
                    child: new Icon(
                      Mdi.chatOutline,
                      color: UIData.PrimaryColor,
                      size: 18.0,
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                  ),
                ],
              ),
            ),
            Text(
              "Taxi driver",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              initialRating: 4,
              itemSize: 20.0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'assets/images/car.png',
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "ST1707",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Toyota Vios",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            LinearPercentIndicator(

              lineHeight: 8.0,
              percent: phantram,
              progressColor: UIData.PrimaryColor
            )
          ])),
    );
  }

  Widget _buildBike1() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: UIData.PrimaryColor),
        color: UIData.transparentbg1,
      ),
      child: ListTile(
        title: Text(
          "JUBERBIKE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$25.00",
          style: TextStyle(
              color: UIData.PrimaryColor, fontWeight: FontWeight.bold),
        ),
        trailing: Image.asset(
          'assets/images/bike.png',
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBike2() {
    return GestureDetector(
      onTap: () => _chonXe(),
      child: ListTile(
        title: Text(
          "JUBERBIKE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$25.00",
          style: TextStyle(
              color: UIData.PrimaryColor, fontWeight: FontWeight.bold),
        ),
        trailing: Image.asset(
          'assets/images/bike.png',
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCar1() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: UIData.PrimaryColor),
        color: UIData.transparentbg1,
      ),
      child: ListTile(
        title: Text(
          "JUBERCAR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$55.00",
          style: TextStyle(
              color: UIData.PrimaryColor, fontWeight: FontWeight.bold),
        ),
        trailing: Image.asset(
          'assets/images/car.png',
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCar2() {
    return GestureDetector(
      onTap: () => _chonXe(),
      child: ListTile(
        title: Text(
          "JUBERCAR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$55.00",
          style: TextStyle(
              color: UIData.PrimaryColor, fontWeight: FontWeight.bold),
        ),
        trailing: Image.asset(
          'assets/images/car.png',
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          isLoading
              ? Center(child: LoaderTwo())
              : GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: _onMapCreated,
                  polylines: Set<Polyline>.of(_polylines.values),
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 16.0,
                  ),
                  markers: _markers,
                ),
          SafeArea(
            child: Column(
              children: <Widget>[
                _builtTop(),
                Spacer(),
                if (trangthai == 0) _buildTrangthaiBooking(),
                if (trangthai == 1) _buildTrangthaiWaiting(),
                if (trangthai == 2) _buildFounddriver(),
              ],
            ),
          ),
          _bildBackbtn(),
        ],
      ),
    );
  }

  _showselectpage() {
    print("click");
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return SelectDesPage();
    }));
  }

  _chonXe() {
    print("click");
    setState(() {
      isCar = !isCar;
    });
  }

  _showpromopage() {
    print("click");
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return PromoPage();
    }));
  }

  _gotodrivercomming() {
    print("click");
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new driverCommingPage(pLacesList: widget.pLacesList);
    }));
  }
}
