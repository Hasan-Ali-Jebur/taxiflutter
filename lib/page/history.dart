import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import '../uidata.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {

  final List<String> avatars = [
    'assets/images/cus1.jpeg',
    'assets/images/cus2.jpeg',
    'assets/images/cus3.jpeg',
  ];
  final List<String> names = [
    'Thuy Linh',
    'Van Lam',
    'Duc Thinh',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildItemRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          //padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: UIData.myBackground),
          child: Column(children: <Widget>[
            ListTile(
              leading: Container(
                height: double.infinity,
                // margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image(
                      image: ExactAssetImage(
                       avatars[i]
                      ),
                    )),
              ),
              title: Text(
                names[i],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Cash payment",
                style: TextStyle(
                    color: UIData.PrimaryColor, fontWeight: FontWeight.bold),
              ),
              trailing: Column(
                children: <Widget>[
                  Text(
                    "\$25",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "2,2 Km",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "PICK UP",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Ninh Kieu Riverside hotel",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ])),
    );
  }

  Widget _buildList(context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: UIData.myBackgroundlight,
      child: ListView.builder(
        // Must have an item count equal to the number of items!
        itemCount: 3,
        // A callback that will return a widget.
        itemBuilder: (context, int) {
          // In our case, a DogCard for each doggo.
          return _buildItemRow(int);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: new AppBar(
          title: new Text('History'),
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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DatePickerTimeline(
              DateTime.now(),
              onDateChange: (date) {
                // New date selected
                print(date.day.toString());
              },
              selectionColor: UIData.PrimaryAssentColor,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      color: UIData.PrimaryColor,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    width: size.width / 2 - 16,
                    child: ListTile(
                      leading: Icon(
                        Icons.directions_car,
                        size: 40,
                        color: Colors.black,
                      ),
                      title: Text("Total jobs"),
                      subtitle: Text(
                        "10",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      color: UIData.PrimaryAssentColor,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    width: size.width / 2 - 10,
                    child: ListTile(
                      leading: Icon(
                        Icons.attach_money,
                        size: 40,
                        color: Colors.black,
                      ),
                      title: Text("Earn"),
                      subtitle: Text(
                        "\$325.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: _buildList(context))
          ],
        ));
  }
}
