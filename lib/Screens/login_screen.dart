import 'package:api_tutorials/Provider/login_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginClass>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: provider.visibility,
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Password',
                suffix: InkWell(
                  onTap: () {
                    provider.joggleVisibility();
                  },
                  child: Icon(
                    provider.visibility
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            InkWell(
              onTap: () {
                provider.loginPage(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: provider.loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
