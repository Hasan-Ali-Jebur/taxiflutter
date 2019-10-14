import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uiflutterjubertaxi/page/chat.dart';

import '../uidata.dart';

class GotoPickupPage extends StatefulWidget {
  GotoPickupPage({Key key}) : super(key: key);

  @override
  _GotoPickupPageState createState() {
    return _GotoPickupPageState();
  }
}

class _GotoPickupPageState extends State<GotoPickupPage> {
  bool trangthaiopen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildTrangthai0() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                offset: Offset(1.0, 6.0),
                blurRadius: 15.0,
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: Column(children: <Widget>[
            GestureDetector(
                onTap: () => {chuyentrangthai()}, child: Text("======"))
          ])),
    );
  }

  Widget _buildTrangthai1() {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: size.height / 2,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                offset: Offset(1.0, 6.0),
                blurRadius: 15.0,
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: Column(children: <Widget>[
            GestureDetector(
                onTap: () => {chuyentrangthai()}, child: Text("======")),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Divider(
                height: 1,
              ),
            ),
            ListTile(
              leading: Icon(Mdi.arrowExpandUp),
              title: Text("Go ahead on Mau Than street"),
            ),
            ListTile(
              leading: Icon(Mdi.arrowExpandRight),
              title: Text(
                "Turn right at market",
                style: TextStyle(color: UIData.PrimaryAssentColor),
              ),
            ),
            ListTile(
              leading: Icon(Mdi.arrowExpandUp),
              title: Text("Go ahead on 30/4 street"),
            ),
            ListTile(
              leading: Icon(Mdi.arrowExpandLeft),
              title: Text("Turn left at Vin hotel"),
            )
          ])),
    );
  }

  Widget _buildItem(IconData icon, String str, Color mau) {
    return Container(
      height: 70,
      width: 80,
      decoration: new BoxDecoration(
        color: mau,
        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            str,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Center(child: new Text('#123456')),
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
        body: Stack(
          children: <Widget>[
            Container(
                child: Column(children: <Widget>[
              ListTile(
                  leading: Container(
                    height: double.infinity,
                    // margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: ExactAssetImage(
                            'assets/images/user.jpeg',
                          ),
                        )),
                  ),
                  title: Text(
                    "Trinh Xuan Nhi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Cash payment",
                    style: TextStyle(
                        color: UIData.PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Column(
                    children: <Widget>[
                      Text(
                        "\$25",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        "2,2 Km",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "PICK UP",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Ninh Kieu Riverside hotel",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Text(
                      "DROP OFF",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Luu Huu Phuoc park",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Text(
                      "NOTE",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildItem(Icons.call, "Call", Colors.greenAccent),
                  GestureDetector(
                      onTap: () => {
                            Navigator.of(context).push(
                                new MaterialPageRoute(builder: (context) {
                              return new ChatTwoPage();
                            }))
                          },
                      child: _buildItem(Icons.chat_bubble_outline, "Message",
                          Colors.lightBlue)),
                  GestureDetector(
                    onTap: () =>{
                      _xacnhacancel()
                    },
                      child: _buildItem(Mdi.cancel, "Cancel", Colors.grey)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: UIData.PrimaryColor,
                height: 100,
                width: double.infinity,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: ()=>{
                          Navigator.pop(context)
                        },
                        child: Text("DROP OFF",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    )),
              )
            ])),
            trangthaiopen ? _buildTrangthai1() : _buildTrangthai0()
          ],
        ));
  }

  chuyentrangthai() {
    print("chuyen tt");
    setState(() {
      trangthaiopen = !trangthaiopen;
    });
  }
  _xacnhacancel(){
    Alert(
      context: context,
      type: AlertType.warning,
      title: "CANCEL THIS RIDE?",
      desc: "Let us know the reason",
      buttons: [

        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: UIData.PrimaryColor, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.black12,
        ),
        DialogButton(
            child: Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: UIData.PrimaryColor
        ),
      ],
    ).show();
  }
}
