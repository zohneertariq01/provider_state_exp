import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:api_tutorials/Screens/Route/routes_name.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text(
                  'Z',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              accountName: Text(
                'Zohneer Tariq',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              accountEmail: Text(
                'zohnirtariq@gmail.com',
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login_outlined, color: Colors.blue),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.red),
              title: Text('Favourite'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.favourite);
              },
            ),
            ListTile(
              leading: Icon(Icons.visibility_off, color: Colors.teal),
              title: Text('Visibility'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.visibility);
              },
            ),
            ListTile(
              leading: Icon(Icons.color_lens, color: Colors.orange),
              title: Text('Theme'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.theme);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle, color: Colors.green),
              title: Text('Counter'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.counter);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.radio_button_checked_outlined,
                color: Colors.purple,
              ),
              title: Text('Slider'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.slider);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Welcome back'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('images/state.png'),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          Center(
              child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Examples',
                textStyle: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
                speed: const Duration(seconds: 1),
              ),
            ],
            totalRepeatCount: 4,
            pause: Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          )),
        ],
      ),
    );
  }
}
