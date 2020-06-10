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
            CircleAvatar(
              backgroundImage: AssetImage(Constant.ASSETS_IMG + 'avatar.jpeg'),
              radius: 50.0,
            )
          ],
        ),
      )
    ,);
  }
}
