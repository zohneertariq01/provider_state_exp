import 'package:api_tutorials/Provider/visibility_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visibility Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<VisibilityClass>(
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: value.visibility,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        value.joggleVisibility();
                      },
                      child: Icon(
                        value.visibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
