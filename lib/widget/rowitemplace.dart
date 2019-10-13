import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:uiflutterjubertaxi/model/placeitem.dart';
import 'package:uiflutterjubertaxi/page/bookpage.dart';

import '../uidata.dart';


class RowItemPlace extends StatefulWidget {
  final Results placeItemRes;
  RowItemPlace(this.placeItemRes);
  @override
  _RowItemBarcodeState createState() => _RowItemBarcodeState();
}

class _RowItemBarcodeState extends State<RowItemPlace> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:  ListTile(
       // leading: Icon(Mdi.mapMarkerOutline,color: UIData.PrimaryColor),
        title: Text(widget.placeItemRes.name),
        subtitle: Text(widget.placeItemRes.formattedAddress),
        trailing: Icon(Mdi.bookmarkOutline,color: Colors.grey),
      ),
    );
  }

  gobooking() {
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) {
      return new BookingPage();
    }));
  }
}
