import 'package:flutter/material.dart';
import 'package:oceanside/pages/blog/index.dart';
import 'package:oceanside/pages/home/index.dart';
import 'package:oceanside/pages/mine/index.dart';

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
  
  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text('云仓库')
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('我的')
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      )
    );
  }
}