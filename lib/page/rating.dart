import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mdi/mdi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uiflutterjubertaxi/model/placeobj.dart';

import '../uidata.dart';

class RatingPage extends StatefulWidget {
  final PLacesList pLacesList;

  RatingPage({Key key, this.pLacesList}) : super(key: key);

  @override
  _driverCommingPageState createState() {
    return _driverCommingPageState();
  }
}

class _driverCommingPageState extends State<RatingPage> {
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
          title: Text("Rating"),
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
                          padding: const EdgeInsets.only(top: 32),
                          child: Text(
                            "HOW IS YOUR TRIP ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Your feedback will help us improve driving experience better",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 24,),
                        RatingBar(
                          //initialRating: 4,
                          itemSize: 32.0,
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
                        SizedBox(height: 24,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            maxLines: 4,
                            decoration: InputDecoration(
                                hintText: "Comments",
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
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FlatButton(
                              color: UIData.PrimaryColor,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              //splashColor: UIData.PrimaryColor,
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "SUBMIT REVIEW",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            )),
                      ],
                    )),
              )
            ],
          ),
        )));
  }


}
