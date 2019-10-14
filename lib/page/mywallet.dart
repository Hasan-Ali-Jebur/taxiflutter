import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:uiflutterjubertaxi/uidata.dart';

import 'payment.dart';
import 'rating.dart';

class MyWalletPage extends StatefulWidget {
  MyWalletPage({Key key}) : super(key: key);

  @override
  _MyWalletPageState createState() {
    return _MyWalletPageState();
  }
}

class _MyWalletPageState extends State<MyWalletPage> {
  final List<String> avatars = [
    'assets/images/cus1.jpeg',
    'assets/images/cus2.jpeg',
    'assets/images/cus3.jpeg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,120,16,0),
      child: Container(
        height: 70,
        //padding: EdgeInsets.fromLTRB(16, 160, 16, 0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new PaymementPage();
              }));
            },
            child: ListTile(
              title: Text("Payment method",style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: IconButton(
                icon: Icon(Icons.navigate_next)

              ),
              leading: RawMaterialButton(

                child: new Icon(
                  Mdi.currencyUsd,
                  color: UIData.Bassic,
                  //size: 18.0,
                ),
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: UIData.PrimaryColor,
                padding: const EdgeInsets.all(15.0),
              ),
            ),
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
        title: new Text('My Wallet'),
        backgroundColor: UIData.PrimaryColor,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: UIData.PrimaryColor,
                height: 150,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "\$325.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text("TOTEL EARN"),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: UIData.myBackground,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 60,bottom: 16),
                        child: Text(
                          "PAYMENT HISTORY",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(8.0)),
                          ),
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                  title: Text(
                                    "Thuy Linh",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text("#443567"),
                                  trailing: Text(
                                    "\$20",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: ExactAssetImage(
                                      avatars[0],
                                    ),
                                  )),
                              Divider(
                                height: 1,
                              ),
                              ListTile(
                                  title: Text(
                                    "Van Lam",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text("#465344"),
                                  trailing: Text(
                                    "\$25",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: ExactAssetImage(
                                      avatars[1],
                                    ),
                                  )),
                              Divider(
                                height: 1,
                              ),
                              ListTile(
                                  title: Text(
                                    "Quang Hai",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text("#890765"),
                                  trailing: Text(
                                    "\$12",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: ExactAssetImage(
                                      avatars[2],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          _buildTop(),
        ],
      ),
    );
  }
}
