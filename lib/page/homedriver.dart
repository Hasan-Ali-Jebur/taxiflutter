import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:uiflutterjubertaxi/page/gotopickup.dart';
import 'package:uiflutterjubertaxi/page/myride.dart';
import 'package:uiflutterjubertaxi/page/notifacation.dart';
import 'package:uiflutterjubertaxi/page/setting.dart';
import 'package:uiflutterjubertaxi/page/support.dart';
import 'package:uiflutterjubertaxi/uidata.dart';
import 'package:uiflutterjubertaxi/widget/clipper.dart';
import 'package:uiflutterjubertaxi/widget/loader2.dart';
import 'package:uiflutterjubertaxi/widget/mybutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'history.dart';
import 'mywallet.dart';

class HomeDriverPage extends StatefulWidget {
  HomeDriverPage({Key key}) : super(key: key);

  @override
  _HomeDriverPageState createState() {
    return _HomeDriverPageState();
  }
}

class _HomeDriverPageState extends State<HomeDriverPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  bool isoff = true;
  var isLoading = true;
  int trangthai = 0;
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  LatLng _center = const LatLng(10.020909, 105.786489);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = const LatLng(10.020909, 105.786489);

  Geolocator _geolocator;
  Position _position;

  AnimationController controller;
  Animation<Offset> offset;

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

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
//      _markers.add(Marker(
//        // This marker id can be anything that uniquely identifies each marker.
//        markerId: MarkerId(_lastMapPosition.toString()),
//        position: _lastMapPosition,
//
//        icon: BitmapDescriptor.defaultMarker,
//        //icon: BitmapDescriptor.fromAsset("assets/images/car.png"),
//      ));

      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,

        //icon: BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromAsset("assets/images/navi96.png"),
      ));
    });
  }

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
        //_positioncar1 = LatLng(lat, newPosition.longitude);
        isLoading = false;
      });
      print("lat:" + _position.latitude.toString());
      print("long:" + _position.longitude.toString());

      //searchPlace();
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  Widget _buildItem(IconData icon, String str1, String des) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            str1,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Text(
          des,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildTrangthai0() {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 6.0),
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage(
                    'assets/images/driver.jpeg',
                  ),
                  minRadius: 90,
                  maxRadius: 150,
                ),
              ),
              title: Text(
                "حسن الحلاق",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: RatingBar.builder(
                initialRating: 3,
                minRating: 1,

                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              trailing: Column(
                children: <Widget>[
                  Text(
                    "25",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Roboto"),
                  ),
                  Text(
                    "يوم",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
  Widget _buildTrangthai1() {
    return SlideTransition(
      position: offset,
      child: Container(
          //padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 15.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: UIData.myBackground),
          child: Column(children: <Widget>[
            ListTile(
              leading: Container(
                height: double.infinity,
                // margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: ExactAssetImage(
                        'assets/images/user.jpeg',
                      ),
                    )),
              ),
              title: Text(
                "Trinh Xuan Nhi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Cash payment",
                style: TextStyle(
                    color: UIData.PrimaryColor, fontWeight: FontWeight.bold),
              ),
              trailing: Column(
                children: <Widget>[
                  Text(
                    "\$25",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "2,2 Km",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "PICK UP",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Ninh Kieu Riverside hotel",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                  Text(
                    "DROP OFF",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Luu Huu Phuoc park",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => {
                                print("click"),
                                setState(() {
                                  trangthai = 0;
                                }),
                                //controller.reverse()
                              },
                          child: Text(
                            "Ignore",
                            style: TextStyle(color: Colors.grey),
                          )),
                      SizedBox(
                        width: 32,
                      ),
                      MyButton(
                          caption: "Accept",
                          onPressed: () {
                            print("Tapped Me");
                            setState(() {
                              trangthai = 0;
                            });
                            Navigator.of(context)
                                .push(new MaterialPageRoute(builder: (context) {
                              return new GotoPickupPage();
                            }));
                          }),
                    ],
                  )
                ],
              ),
            )
          ])),
    );
  }

  Widget _buildthongbao() {
    return AnimatedOpacity(
      opacity: isoff ? 0.0 : 1.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        color: UIData.PrimaryAssentColor,
        child: ListTile(
          leading: Icon(Mdi.carOff),
          title: Text(
            "انت الان مشغول",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("اضغط على الزر اعلاه لتفعيل استقبال الحجوزات"),
        ),
      ),
    );
  }

  /*_buildDrawer() {
    final String image = 'assets/images/driver.jpeg';
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
                        // _xacnhanthoat();
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
                    "JEETEBE",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                      //height: 30,
                      //width: 150,
                      //color: Colors.green,
                      // alignment: Alignment.topCenter,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: UIData.PrimaryColor,
                      ),
                      Text("Gold member")
                    ],
                  )),
                  SizedBox(height: 30.0),
                  _buildRow(Mdi.walletOutline, "بسم الله", goid: 1),
                  _buildDivider(),
                  _buildRow(Mdi.history, "History", goid: 2),
                  _buildDivider(),
                  _buildRow(Mdi.bellOutline, "Notification",
                      showBadge: true, goid: 3),
                  _buildDivider(),
                  _buildRow(Mdi.cogs, "Setting", goid: 4),
                  _buildDivider(),
                  _buildRow(Icons.headset, "Support", goid: 5),
                  _buildDivider(),
                  Container(
                      color: UIData.PrimaryColor,
                      child: _buildRow(
                          Icons.directions_car, "New booking (Demo)",
                          goid: 100)),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }*/
  _buildDrawer() {
    final String image = 'assets/images/driver.jpeg';
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: UIData.PrimaryColor,
                      ),
                      onPressed: () {
                        // _xacnhanthoat();
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
                    "حسن الحلاق",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    //height: 30,
                    //width: 150,
                    //color: Colors.green,
                    // alignment: Alignment.topCenter,
                    /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: UIData.PrimaryColor,
                    ),
                    Text("Gold member")
                  ],
                )*/),
                  SizedBox(height: 30.0),
                  _buildRow(FontAwesomeIcons.user, "الملف الشخصي", goid: 1),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.fileAlt, "المستندات", goid: 2),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.carAlt, "العجلة",
                      showBadge: true, goid: 3),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.creditCard, "محفظتي", goid: 4),
                  _buildDivider(),
                  _buildRow(Mdi.cogs, "اعدادات", goid: 5),
                  _buildDivider(),
                  Container(
                      color: UIData.PrimaryColor,
                      child: _buildRow(
                          Icons.directions_car, "New booking (Demo)",
                          goid: 100)),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      //onWillPop: _onWillPop,
        child: Scaffold(
            key: _key,
            drawer: _buildDrawer(),
            appBar: new AppBar(
              title: isoff ? Text('متاح') : Text('مشغول'),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: new IconButton(
                icon: new Icon(Icons.menu, color: UIData.Bassic),
                onPressed: () {
                  _key.currentState.openDrawer();
                },
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:  CupertinoSwitch(
                    activeColor: UIData.PrimaryColor,
                    value: isoff,
                    onChanged: (bool value) {
                      setState(() {
                        isoff = !isoff;
                      });
                    },
                  ),
                ),

              ],
            ),
            body: Stack(children: <Widget>[
              isLoading
                  ? Center(child: LoaderTwo())
                  : GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 16.0,
                      ),
                      markers: _markers,
                    ),
              SafeArea(
                child: Column(
                  children: <Widget>[
//                    isoff
//                        ? SizedBox(
//                            height: 1,
//                          )
//                        : _buildthongbao(),
                    _buildthongbao(),
                    Spacer(),
                    if (trangthai == 0)
                      _buildTrangthai0(),
                    if (trangthai == 1)
                      _buildTrangthai1(),
                  ],
                ),
              ),
            ])));
  }

  _goto(int goid) {
    print("go ${goid}");
    Navigator.of(context).pop(); //close drawer
    switch (goid) {
      case 1:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return MyWalletPage();
          }));
        }
        break;
      case 2:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return HistoryPage();
          }));
        }
        break;
      case 3:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return NotificationPage();
          }));
        }
        break;
      case 4:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return SettingPage();
          }));
        }
        break;
      case 5:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return SupportPage();
          }));
        }
        break;

      case 100:
        {
          setState(() {
            trangthai = 1;
          });
        }
        break;
    }
  }
}
