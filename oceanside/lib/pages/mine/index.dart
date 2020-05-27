import 'package:flutter/material.dart';
import 'package:oceanside/common/constant.dart';
import 'package:oceanside/pages/mine/list.dart';

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
            width: 415,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constant.ASSETS_IMG + 'background.jpeg'),
                fit: BoxFit.cover
            )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                      AssetImage(Constant.ASSETS_IMG + 'avatar.jpeg'),
                    radius: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      '点我登录',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                  )
                ],
            )),
          ),),
          Expanded(
            flex: 2,
            child: OceanList()
          )
        ],
      ),
    );
  }
}
