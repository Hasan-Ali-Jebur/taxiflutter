import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mdi/mdi.dart';
import 'package:uiflutterjubertaxi/model/placeitem.dart';
import 'package:uiflutterjubertaxi/service/callapi.dart';
import 'package:uiflutterjubertaxi/widget/loader2.dart';
import 'package:uiflutterjubertaxi/widget/rowitemplace.dart';

import '../uidata.dart';

class PromoPage extends StatefulWidget {
  @override
  _SelectDesPageState createState() {
    return _SelectDesPageState();
  }
}

class _SelectDesPageState extends State<PromoPage> {
  List<Results> mylist = [];

  final myController1 = TextEditingController();

  void initState() {
    super.initState();
    //searchPlace();
  }

  Widget _buildList(context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: UIData.myBackgroundlight,
      child: ListView.builder(
        // Must have an item count equal to the number of items!
        itemCount: 3,
        // A callback that will return a widget.
        itemBuilder: (context, int) {
          // In our case, a DogCard for each doggo.
          return _buildItem();
        },
      ),
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () => {
          Navigator.of(context).pop()
        },
        child: Container(
          //color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(8),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(16.0)),
                ),
                child: new Center(
                    child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: UIData.transparentbg1,
                  child: Icon(
                    Mdi.sale,
                    size: 30,
                    color: UIData.PrimaryColor,
                  ),
                )),
              ),
              DottedBorder(
                padding: EdgeInsets.all(0),
                color: Colors.black12,
                //strokeWidth: 1,
                child: SizedBox(height: 70,width: 1,),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: EdgeInsets.all(14),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(16.0)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "10% sale off",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Valid to 24/10/2019",style: TextStyle(color: Colors.grey),),
                      Align(child: Text("Use now",style: TextStyle(color: UIData.PrimaryColor,fontSize: 15,fontWeight: FontWeight.bold),), alignment: Alignment.centerRight),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        //title: new Text('Name here'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "My Promotion",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: UIData.myBackgroundlight,
                    hintText: "Enter your promotion code",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black26),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(child: _buildList(context))
          ],
        ),
      ),
    );
  }
}
