import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:oceanside/model/theme_model.dart';
import 'common/constant.dart';
import 'config/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Color _themeColor;
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ThemeModel())],
      child: Consumer<ThemeModel>(
        builder: (context, apptheme, _) {
          String colorKey = apptheme.themeColor;
          if(themeColorMap[colorKey] != null) {
            _themeColor = themeColorMap[colorKey];
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: _themeColor,
              accentColor: _themeColor,
            ),
            // home: MyHomePage(title: 'Flutter Demo Home Page'),
            // home: TabNavigator(),
            onGenerateRoute: Router.generateRoute,
            initialRoute: RouteName.tab,
          );
        }
      ),
    );
  }
}
