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
        builder: (context, appinfo, _) {
          String colorKey =appinfo.themeColor;
          if(themeColorMap[colorKey] != null) {
            _themeColor = themeColorMap[colorKey];
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: _themeColor,
              accentColor: _themeColor,
              // iconTheme: IconThemeData(color: _themeColor)
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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   get isInitialRoute => null;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//             FlatButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {return NewRoute(value: '我就是第一页想传给你第二页的数据',);},
//                     settings: RouteSettings(name: 'happy', isInitialRoute: true), // 没啥效果啊老铁
//                     // fullscreenDialog: true //表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）
//                   )
//                 );
//               },
//               child: Text("open new route"),
//               textColor: Colors.blue,
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
