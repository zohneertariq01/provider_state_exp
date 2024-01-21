import 'package:api_tutorials/Provider/theme_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Screen'),
        actions: [
          Icon(Icons.favorite),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<ThemeClass>(builder: (context, value, child) {
            return RadioListTile<ThemeMode>(
              title: Text('Light Theme'),
              value: ThemeMode.light,
              groupValue: value.themeMode,
              onChanged: value.themeChanger,
            );
          }),
          Consumer<ThemeClass>(builder: (context, value, child) {
            return RadioListTile<ThemeMode>(
              title: Text('Dark Theme'),
              value: ThemeMode.dark,
              groupValue: value.themeMode,
              onChanged: value.themeChanger,
            );
          }),
        ],
      ),
    );
  }
}
