import 'package:flutter/material.dart';

import 'package:oceanside/common/constant.dart';

class NotLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                      AssetImage(Constant.ASSETS_IMG + 'avatar.jpeg'),
                    radius: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      '未登录',
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: RaisedButton(
                  color: Colors.transparent,
                  // elevation: 100,
                  child: Text('登录', style: TextStyle(fontSize: 15)),
                  onPressed: () {},
                )
              )
            )
          ],
        ),
      )
    ,);
  }
}
