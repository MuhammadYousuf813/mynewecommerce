import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? darkTheme : lightTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Theme',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              SwitchListTile(
                title: Text('Dark Mode'),
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                value: isDarkMode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
