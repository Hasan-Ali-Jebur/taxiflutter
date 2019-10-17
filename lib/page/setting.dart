import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:uiflutterjubertaxi/page/document.dart';
import 'package:uiflutterjubertaxi/uidata.dart';

import 'profile.dart';
import 'verhicle.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildIcon(IconData icon, String str, Color backgroundColor,{int i}) {
    return InkWell(
      onTap: () => goto(i),
      child: Container(
          color: Colors.white,

          child: ListTile(
            leading: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Icon(
                  icon,
                  color: Colors.white,
                )),
            title: Text(str),
            trailing: Icon(Icons.navigate_next),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Setting'),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: ()=>{
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }))
              },
              child: ListTile(
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
                    "Jeetebe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Gold member"),
                  trailing: IconButton(

                      icon: Icon(
                        Icons.navigate_next,
                      ))),
            ),

            buildIcon(
                Icons.directions_car, "Vehicle Management", Colors.orange, i:1),
            buildIcon(
                Mdi.certificate, "Document Management", Colors.green,i:2),
            buildIcon(Mdi.star, "Review", Colors.yellow),
            buildIcon(Mdi.web, "Language", Colors.blue),
            SizedBox(
              height: 16,
            ),
            buildIcon(Mdi.bell, "Notification", Colors.pinkAccent),
            buildIcon(Mdi.security, "Terms and Privacy policy", Colors.grey),
            //buildIcon(Mdi.web, "Language", Colors.blue),
          ],
        ));
  }

  goto(int goid) {
    print("go ${goid}");

    switch (goid) {
      case 1:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return VerhiclePage();
          }));
        }
        break;
      case 2:
        {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return DocumentPage();
          }));
        }
        break;
    }
  }
}
