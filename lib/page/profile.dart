import 'package:flutter/material.dart';

import '../uidata.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        //title: new Text('Setting'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
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
                  //Icon(Icons.check,color: UIData.PrimaryColor ),
                  Text(
                    "Edit",
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
      body: Column(
        children: <Widget>[
          Container(
            //color: Colors.blue,
            height: size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: UIData.PrimaryColor,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: ExactAssetImage(
                      'assets/images/driver.jpeg',
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "JEETEBE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    //height: 30,
                    //width: 150,
                    //color: Colors.green,
                    // alignment: Alignment.topCenter,
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: UIData.PrimaryColor,
                    ),
                    Text("Gold member")
                  ],
                )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 8),
              child: Text(
                "INFORMATION",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
              ),
            ),
          ),
          MyListTile(str1: "Username",str2: "Jeetebe",),
          MyListTile(str1: "Phone number",str2: "+84.939 xxx xxx",),
          MyListTile(str1: "Email",str2: "Jeetebe@gmail.com",),
          MyListTile(str1: "Gender",str2: "Male",),
          MyListTile(str1: "Birthday",str2: "xx/xx/xx",),
        ],
      ),
    );
  }
}

class BolbText extends StatelessWidget {
  final String str;

  const BolbText({Key key, this.str}) : super(key: key);
  Widget build(context) {
    return new Text(
      str,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
class MyListTile extends StatelessWidget {
  final String str1,str2;

  const MyListTile({Key key,  this.str1, this.str2}) : super(key: key);
  Widget build(context) {
    return Container(
      color: Colors.white,
      child: new ListTile(
        title: Text(str1,style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Text(str2),
      ),
    );
  }
}
