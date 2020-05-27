import 'package:flutter/material.dart';

class OceanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.favorite_border, color: Colors.purple[200],),
          title: Text('收藏'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.brightness_2, color: Colors.purple[200],),
          title: Text('黑夜模式'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.palette, color: Colors.purple[200],),
          title: Text('色彩主题'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.purple[200],),
          title: Text('设置'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.error_outline, color: Colors.purple[200],),
          title: Text('关于'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        )
      ],
    );
  }
}