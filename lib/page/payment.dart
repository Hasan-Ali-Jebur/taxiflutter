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

class PaymementPage extends StatefulWidget {
  @override
  _SelectDesPageState createState() {
    return _SelectDesPageState();
  }
}

class _SelectDesPageState extends State<PaymementPage> {

  final myController1 = TextEditingController();
  int num =0;

  void initState() {
    super.initState();
    //searchPlace();
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
            child: GestureDetector(
              onTap: ()=>{
                Navigator.of(context).pop(),
              },
              child: Row(
                children: <Widget>[
                  //Icon(Icons.check,color: UIData.PrimaryColor ),
                  Text("Done",style: TextStyle(color: UIData.PrimaryColor,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Payment",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),

            InkWell(
              onTap: ()=>{
                _dochange(0)
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/cash.png'),
                    title: Text ("Cash payment"),
                    subtitle: Text ("Default"),
                    trailing: (num==0) ?Icon(Icons.check_box, color: UIData.PrimaryColor,):null,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: ()=>{
                _dochange(1)
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/master.png'),
                    title: Text ("**** **** **** 1234"),
                    subtitle: Text ("Expired 07/21"),
                    trailing: (num==1) ?Icon(Icons.check_box, color: UIData.PrimaryColor,):null,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: ()=>{
                _dochange(2)
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/visa.png'),
                    title: Text ("**** **** **** 5678"),
                    subtitle: Text ("Expired 07/21"),
                    trailing: (num==2) ?Icon(Icons.check_box, color: UIData.PrimaryColor,):null,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: ()=>{
                _dochange(3)
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/paypal.png'),
                    title: Text ("Jeetebe@gmail.com"),
                    subtitle: Text (""),
                    trailing: (num==3) ?Icon(Icons.check_box, color: UIData.PrimaryColor,):null,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FlatButton(
                    color: UIData.PrimaryColor,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    //splashColor: UIData.PrimaryColor,
                    onPressed: () {},
                    child: Text(
                      "ADD PAYMENT METHOD",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )),
            ),


          ],
        ),
      ),
    );
  }

  _dochange(int n) {
    setState(() {
      num=n;
    });
  }
}
