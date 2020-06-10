import 'package:flutter/material.dart';

import 'package:oceanside/widget/not_login.dart';

class Collect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的收藏')),
      body: NotLogin(),
    );
  }
}
