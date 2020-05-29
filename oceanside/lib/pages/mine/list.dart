import 'package:flutter/material.dart';
import 'package:oceanside/model/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:oceanside/common/constant.dart';

class OceanList extends StatelessWidget {
  dynamic _colorKey;
  // dynamic _themeColor;
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
          // trailing: Icon(Icons.keyboard_arrow_right),
          trailing: Switch(value: true, onChanged: null, activeColor: Colors.purple[200],activeTrackColor: Colors.purple[200],),
          onTap: () {},
        ),
        // ListTile(
        //   leading: Icon(Icons.palette, color: Colors.purple[200],),
        //   title: Text('色彩主题'),
        //   trailing: Icon(Icons.keyboard_arrow_down),
        //   onTap: () {},
        // ),
        ExpansionTile(
          leading: Icon(Icons.color_lens),
          title: Text('颜色主题'),
          initiallyExpanded: false,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: themeColorMap.keys.map((key) {
                  Color value = themeColorMap[key];
                  return InkWell(
                    onTap: () {
                      // setState(() {
                      //   _colorKey = key;
                      // });
                      // SpUtil.putString('key_theme_color', key);
                      Provider.of<ThemeModel>(context, listen: false)
                          .setTheme(_colorKey = key);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      color: value,
                      child: _colorKey == key
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            )
          ],
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
