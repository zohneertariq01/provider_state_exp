import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;
      print(counter);
      setState(() {});
    });
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Why Provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Celendar' +
                ' ' +
                DateTime.now().hour.toString() +
                ':' +
                DateTime.now().minute.toString() +
                ':' +
                DateTime.now().second.toString()),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Timer:' + ' ' + counter.toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Center(
          child: Icon(
            Icons.add_circle,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ),
    );
  }
}
