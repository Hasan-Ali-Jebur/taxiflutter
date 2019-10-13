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

class FavoritePage extends StatefulWidget {
  @override
  _SelectDesPageState createState() {
    return _SelectDesPageState();
  }
}

class _SelectDesPageState extends State<FavoritePage> {
  List<String> list1 = ["Hightland","Ninh Kieu hotel","Float market"];
  List<String> list2 = ["27 Mau Than","12 Hai Ba Trung","Cai Rang, Can Tho, Viet Nam"];

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
          return _buildItem(int);
        },
      ),
    );
  }

  Widget _buildItem(int i) {
    return ListTile(
      leading: Icon(Mdi.mapMarkerCircle,color: UIData.PrimaryColor,),
      title: Text(list1[i]),
      subtitle: Text(list2[i]),
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:16.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.add,color: UIData.PrimaryColor ),
                Text("Add",style: TextStyle(color: UIData.PrimaryColor,fontWeight: FontWeight.bold),)
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "My Favorite",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Mdi.homeOutline),
              title: Text ("Home"),
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Mdi.briefcaseOutline),
              title: Text ("Work"),
              trailing: Icon(Icons.navigate_next),
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
