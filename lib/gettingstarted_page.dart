import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';

class GettingStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/app_logo.png',
              width: 150.0,
              height: 150.0,
            ),
            Text(
              'Welcome to Language Link',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Start your language learning journey today!',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Already have an account? Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
