import 'package:flutter/material.dart';
import 'package:uiflutterjubertaxi/uidata.dart';

class MyRidePage extends StatefulWidget {
  MyRidePage({Key key}) : super(key: key);

  @override
  _MyRidePageState createState() {
    return _MyRidePageState();
  }
}

class _MyRidePageState extends State<MyRidePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'ACTIVE'),
    new Tab(text: 'HISTORY'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildItem(int loai) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (loai==1)
                Container(
                    padding: EdgeInsets.all(8),
                    color: UIData.PrimaryAssentColor,
                    child: Text("ONGOING",
                        style: TextStyle(color: Colors.white))),

                if (loai==2)
                  Container(
                      padding: EdgeInsets.all(8),
                      color: UIData.PrimaryColor,
                      child: Text("FINISHED",
                          style: TextStyle(color: Colors.white))),
                if (loai==3)
                  Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.grey,
                      child: Text("CANCELED",
                          style: TextStyle(color: Colors.white))),
                Text(
                  "10/10/2019",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(
                  "20 Ninh Kieu hotel, Can Tho, Viet Nam",
                  maxLines: 1,
                ),
                leading: Icon(
                  Icons.my_location,
                  color: UIData.Bassic,
                ),
              ),
              ListTile(
                title: Text(
                  "Cai Rang float market, Can Tho, Viet Nam",
                ),
                leading: Icon(
                  Icons.location_on,
                  color: UIData.PrimaryColor,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    MyIcon(icon: Icons.access_time),
                    MyText(str: "15:00"),
                  ],
                ),
                (loai==3)?
                Row(
                  children: <Widget>[
                    MyIcon(icon:Icons.motorcycle),
                    MyText(str: "JUBERBIKE"),
                  ],
                ):
                Row(
                  children: <Widget>[
                    MyIcon(icon:Icons.local_taxi),
                    MyText(str: "JUBERCAR"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    MyIcon(icon: Icons.credit_card),
                    MyText(str: "Cash : 25\$"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Tab1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _buildItem(1)],
      ),
    );
  }
  Widget Tab2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _buildItem(2),
          _buildItem(3),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "My booking",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        bottom: new TabBar(
          labelColor: UIData.PrimaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: UIData.PrimaryColor,
          controller: _tabController,
          tabs: myTabs,
        ),
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: new TabBarView(
          controller: _tabController, children: [Tab1(), Tab2()]),
    );
  }
}

class MyText extends StatelessWidget {
  final String str;

  const MyText({Key key, this.str}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: TextStyle(color: Colors.grey),
    );
  }
}

class MyIcon extends StatelessWidget {
  final IconData icon;

  const MyIcon({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.grey,
    );
  }
}
