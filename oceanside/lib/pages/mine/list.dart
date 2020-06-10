import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flustars/flustars.dart';

import 'package:oceanside/config/router.dart';
import 'package:oceanside/model/theme_model.dart';
import 'package:oceanside/common/constant.dart';

class OceanList extends StatefulWidget {
  OceanList({Key key}) : super(key: key);

  @override
  _OceanListState createState() => _OceanListState();
}

class _OceanListState extends State<OceanList> {
  String _colorKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, apptheme, _) {
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.favorite_border, color: themeColorMap[apptheme.themeColor],),
              title: Text('收藏', style: TextStyle(color: themeColorMap[apptheme.themeColor]),),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamed(RouteName.collectList);
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_2, color: themeColorMap[apptheme.themeColor],),
              title: Text('黑夜模式', style: TextStyle(color: themeColorMap[apptheme.themeColor]),),
              // trailing: Icon(Icons.keyboard_arrow_right),
              trailing: Switch(value: true, onChanged: null, activeColor: themeColorMap[apptheme.themeColor],activeTrackColor: themeColorMap[apptheme.themeColor],),
              onTap: () {},
            ),
            ExpansionTile(
              leading: Icon(Icons.color_lens, color: themeColorMap[apptheme.themeColor],),
              title: Text(
                '颜色主题',
                style: TextStyle(color: themeColorMap[apptheme.themeColor]),
              ),
              initiallyExpanded: false,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: themeColorMap.keys.map((key) {
                      Color value = themeColorMap[key];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _colorKey = key;
                          });
                          SpUtil.putString('key_theme_color', key);
                          Provider.of<ThemeModel>(context, listen: false).setTheme(_colorKey = key);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          color: value,
                          child: _colorKey == key ? Icon(Icons.done,color: Colors.white,) : null,
                        ),
                      );
                    }).toList(),
                  ),
                )
              ]
            ),
            ListTile(
              leading: Icon(Icons.settings, color: themeColorMap[apptheme.themeColor],),
              title: Text('设置', style: TextStyle(color: themeColorMap[apptheme.themeColor]),),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.error_outline, color: themeColorMap[apptheme.themeColor],),
              title: Text('关于', style: TextStyle(color: themeColorMap[apptheme.themeColor]),),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            )
          ],
        );
      }
    );
  }
}
