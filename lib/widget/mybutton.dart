import 'package:flutter/material.dart';

import '../uidata.dart';

class MyButton extends StatelessWidget {
  final String caption;
  final GestureTapCallback onPressed;
  MyButton({Key key, this.caption, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      color: UIData.PrimaryColor,
      textColor: UIData.Bassic,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.fromLTRB(24,8,24,8),
      splashColor: UIData.Bassic,
      onPressed: () {
        onPressed;
      },
      child: Text(
        caption,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
