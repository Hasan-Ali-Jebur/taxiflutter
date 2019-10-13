import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:uiflutterjubertaxi/model/placeitem.dart';
import 'package:uiflutterjubertaxi/model/placeobj.dart';
import 'package:uiflutterjubertaxi/service/callapi.dart';
import 'package:uiflutterjubertaxi/widget/loader2.dart';
import 'package:uiflutterjubertaxi/widget/rowitemplace.dart';

import '../uidata.dart';
import 'bookpage.dart';

class SelectDesPage extends StatefulWidget {
  final Placeobj placepickobj;

  const SelectDesPage({Key key, this.placepickobj}) : super(key: key);

  @override
  _SelectDesPageState createState() {
    return _SelectDesPageState();
  }
}

class _SelectDesPageState extends State<SelectDesPage> {
  List<Results> places = [];
  final CallApi _callApi = new CallApi();
  var isLoading = false;
  final myController1 = TextEditingController();
  final myControllerpick = TextEditingController();

  PLacesList pLacesList = new PLacesList();

  //_SelectDesPageState(this.placepickobj);

  void initState() {
    super.initState();
    //searchPlace();
    setState(() {
      myControllerpick.text = widget.placepickobj.placename;

      pLacesList.pick = widget.placepickobj;
    });
  }

  Future searchPlace() async {
    print("searchPlace....");
    List<Results> list = await _callApi.searchPlace(myController1.text);
    setState(() {
      places = list;
      isLoading = false;
    });
    print("size:" + places.length.toString());
  }

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: places.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return InkWell(
            onTap: () => {_gotobooking(places[int])},
            child: RowItemPlace(places[int]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              MaterialButton(
                padding: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(Icons.clear),
                //color: Colors.white,
                textColor: Colors.black,
                minWidth: 0,
                height: 40,
                onPressed: () => Navigator.pop(context),
              ),
              MaterialButton(
                padding: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(Mdi.mapLegend),
                //color: Colors.white,
                textColor: Colors.black,
                minWidth: 0,
                height: 40,
                onPressed: () => Navigator.pop(context),
              ),
            ]),
            TextField(
              controller: myControllerpick,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.my_location,
                    color: UIData.Bassic,
                  ),
                  // suffixIcon: Icon(Icons.clear, color: Colors.grey),

                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black26),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: myController1,
              onChanged: (str) {
                searchPlace();
              },

              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: UIData.PrimaryColor,
                  ),
                  border: InputBorder.none,
                  hintText: "Enter Destination",
                  hintStyle: TextStyle(color: Colors.black26),
                  suffixIcon: GestureDetector(
                      onTap: (){
                        print("clear");
                        myController1.clear();

                      },
                      child: Icon(Icons.clear, color: Colors.grey)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
            ),
            Divider(
              color: Colors.grey,
            ),
            isLoading
                ? Center(child: LoaderTwo())
                : Expanded(child: _buildList(context))
          ],
        ),
      ),
    );
  }

  _gotobooking(Results obj) {
    LatLng dest = LatLng(obj.geometry.location.lat, obj.geometry.location.lng);
    print("dest ${obj}");
    Placeobj placeobj =
        Placeobj(placename: obj.formattedAddress, placeLatlng: dest);
    pLacesList.dest = placeobj;
    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) {
      return BookingPage(
          pLacesList: pLacesList);
    }));
  }
}
