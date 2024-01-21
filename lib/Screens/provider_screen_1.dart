import 'package:api_tutorials/Provider/provider_class_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScreen1 extends StatefulWidget {
  const ProviderScreen1({super.key});

  @override
  State<ProviderScreen1> createState() => _ProviderScreen1State();
}

class _ProviderScreen1State extends State<ProviderScreen1> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen 1'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<ProviderClass1>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.sliderValue,
              onChanged: (val) {
                value.onChange(val);
              },
            );
          }),
          Consumer<ProviderClass1>(builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.sliderValue),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text('Side 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.sliderValue),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text('Side 2'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
