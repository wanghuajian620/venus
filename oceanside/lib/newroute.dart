import 'package:flutter/material.dart';
import 'package:oceanside/pages/blog/index.dart';

class NewRoute extends StatelessWidget {
  final value;
  NewRoute({Key key, @required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('$value'),
              onPressed: () {
                Navigator.pop(context);
              }
            ),
            RaisedButton(
              child: Text('进入第三页'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyBlog()));
              }
            )
          ],
        ),
    ));
  }
}
