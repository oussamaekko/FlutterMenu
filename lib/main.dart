import 'package:flutter/material.dart';
import 'package:pitch_project/MenuItem.dart';
import 'package:pitch_project/villes-page.dart';
import 'package:pitch_project/setting-page.dart';
import 'package:pitch_project/About-page.dart';
import 'package:flutter/services.dart' as http;

void main() => runApp(MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.blue[900])),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final menus = [
    {'title': 'Home', 'icon': Icon(Icons.home), 'page': VillePage()},
    {'title': 'Settings', 'icon': Icon(Icons.settings), 'page': SettingPage()},
    {'title': 'About', 'icon': Icon(Icons.info), 'page': AboutPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pitch Page"),
      ),
      body: Center(
        child: Text("Home Pitch ..."),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("./images/user.png"),
                  backgroundColor: Colors.transparent,
                  minRadius: 180,
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[900]!, Colors.blue[100]!])),
            ),
            ...menus.map((item) {
              return new Column(
                children: <Widget>[
                  Divider(
                    color: Colors.blue[900],
                  ),
                  menuItem(item['title'] as String, item['icon'] as Icon,
                      (context) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => item['page'] as Widget));
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
