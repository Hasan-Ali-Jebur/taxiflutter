import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class SupportPage extends StatefulWidget {
  SupportPage({Key key}) : super(key: key);

  @override
  _SupportPageState createState() {
    return _SupportPageState();
  }
}

class _SupportPageState extends State<SupportPage> {
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
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        //title: new Text('Support'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/help.png'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("+84.939 xxx xxx", style: Theme.of(context).textTheme.title),
              ),
              Text("jeetebe@gmail.com"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Mdi.web),
                  ),
                  Text("https://apptot.vn"),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}