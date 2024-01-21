import 'dart:async';

import 'package:api_tutorials/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<ProviderClass>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      provider.addCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final provider = Provider.of<ProviderClass>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Consumer<ProviderClass>(
              builder: (context, value, child) {
                return Text(
                  value.counter.toString(),
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.addCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
