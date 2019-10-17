import 'package:flutter/material.dart';

import '../uidata.dart';

class VerhiclePage extends StatefulWidget {
  VerhiclePage({Key key}) : super(key: key);

  @override
  _VerhiclePageState createState() {
    return _VerhiclePageState();
  }
}

class _VerhiclePageState extends State<VerhiclePage> {
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
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Verhicle management'),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () => {
                  Navigator.of(context).pop(),
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add, color: UIData.PrimaryColor),
                    Text(
                      "Add",
                      style: TextStyle(
                          color: UIData.PrimaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
            child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text("Madza"),
                subtitle: Text("65A3479"),
                trailing: Icon(Icons.check_circle,color: UIData.PrimaryAssentColor,),
                leading: CircleAvatar(
                  backgroundColor: UIData.PrimaryColor,
                  maxRadius: 30.0,
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Toyota"),
                subtitle: Text("65C5432"),
                trailing: Icon(Icons.blur_circular,color: UIData.PrimaryAssentColor,),
                leading: CircleAvatar(
                  backgroundColor: UIData.PrimaryColor,
                  maxRadius: 30.0,
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
