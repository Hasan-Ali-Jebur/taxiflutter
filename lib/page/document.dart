import 'package:flutter/material.dart';

import '../uidata.dart';

class DocumentPage extends StatefulWidget {
  DocumentPage({Key key}) : super(key: key);

  @override
  _VerhiclePageState createState() {
    return _VerhiclePageState();
  }
}

class _VerhiclePageState extends State<DocumentPage> {
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
          title: new Text('Document'),
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
                Card(child: Image.asset("assets/images/idcard.png")),
                Card(child: Image.asset("assets/images/driverlicence.png")),
              ],
            )));
  }
}
