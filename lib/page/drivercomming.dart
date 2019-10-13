import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mdi/mdi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uiflutterjubertaxi/model/placeobj.dart';

import '../uidata.dart';

class driverCommingPage extends StatefulWidget {
  final PLacesList pLacesList;


  driverCommingPage({Key key, this.pLacesList}) : super(key: key);

  @override
  _driverCommingPageState createState() {
    return _driverCommingPageState();
  }
}

class _driverCommingPageState extends State<driverCommingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: new AppBar(
          //title: new Text('Name here'),
          backgroundColor: UIData.Bassic,
          elevation: 0,
          title: Text("Driver on the way"),
          leading: new IconButton(
            icon: new Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.fromLTRB(16, 22, 16, 16),
          color: UIData.Bassic,
          child: Column(
            children: <Widget>[
              Container(
                  height: 130,
                  padding: EdgeInsets.all(8),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(16.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Taxi driver",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RatingBar(
                              initialRating: 4,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "ST1707",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Toyota Vios",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/car.png',
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Dash(length: width - 100, dashColor: Colors.white),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(16.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text("FARE"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "\$55.50",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: UIData.PrimaryColor),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.my_location,
                            color: UIData.Bassic,
                          ),
                          title: Text("PICK UP"),
                          subtitle: Text(widget.pLacesList.pick.placename),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: UIData.PrimaryColor,
                          ),
                          title: Text("DESTINATION"),
                          subtitle: Text(widget.pLacesList.dest.placename),
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FlatButton(
                              color: UIData.myBackground,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              splashColor: UIData.PrimaryColor,
                              onPressed: () {
                               _xacnhacancel();
                              },
                              child: Text(
                                "CANCEL BOOKING",
                                style: TextStyle(fontSize: 20.0 ),
                              ),
                            )),
                      ],
                    )),
              )
            ],
          ),
        )));
  }
  _xacnhacancel(){
    Alert(
      context: context,
      type: AlertType.warning,
      title: "CANCEL THIS RIDE?",
      desc: "Passenger that cancel less get faster bookings",
      buttons: [

        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: UIData.PrimaryColor, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.black12,
        ),
        DialogButton(
            child: Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: UIData.PrimaryColor
        ),
      ],
    ).show();
  }
}
