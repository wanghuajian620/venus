import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flustars/flustars.dart';

import 'package:oceanside/model/theme_model.dart';
import 'package:oceanside/pages/blog/index.dart';
import 'package:oceanside/pages/home/index.dart';
import 'package:oceanside/pages/mine/index.dart';
import 'package:oceanside/common/constant.dart';


List<Widget> pages = <Widget>[
  Home(),
  MyBlog(),
  Mine()
];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
 
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;
  String _colorKey;

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  Future<void> _initAsync() async {
    await SpUtil.getInstance();
    _colorKey = SpUtil.getString('key_theme_color', defValue: 'blue');
    // 设置初始化主题颜色
    Provider.of<ThemeModel>(context, listen: false).setTheme(_colorKey);
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, apptheme, _) {
        return Scaffold(
          body: WillPopScope(
            child: PageView.builder(
              itemBuilder: (context, index) => pages[index],
              itemCount: pages.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            onWillPop: () async {
              if (_lastPressed == null ||
                  DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
                //两次点击间隔超过1秒则重新计时
                _lastPressed = DateTime.now();
                return false;
              }
              return true;
            }
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: themeColorMap[apptheme.themeColor],),
                title: Text('首页', style: TextStyle(color: themeColorMap[apptheme.themeColor]),)
              ),
                BottomNavigationBarItem(
                icon: Icon(Icons.cloud, color: themeColorMap[apptheme.themeColor],),
                title: Text('云仓库', style: TextStyle(color: themeColorMap[apptheme.themeColor]),)
              ),
                BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: themeColorMap[apptheme.themeColor],),
                title: Text('我的', style: TextStyle(color: themeColorMap[apptheme.themeColor]),)
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          )
        );
      }
    );
  }
}


