import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'login_page.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/app_logo.png',
                  width: 150.0,
                  height: 150.0,
                ),
                Text(
                  'Language Link',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '"Your Native Tongue Translator"',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPage(),
                      ),
                    );
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Back to login'),
                ),
                SizedBox(height: 16.0),
                Text('Or register with',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return IconButton(
                            onPressed: () {
                              // Add Gmail login logic here
                            },
                            icon: Image.asset(
                              'assets/google_logo.png',
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      width: 70.0,
                      height: 70.0,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return IconButton(
                            onPressed: () {
                              // Add Facebook login logic here
                            },
                            icon: Image.asset(
                              'assets/facebook_logo.png',
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
