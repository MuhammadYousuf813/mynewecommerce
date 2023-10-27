import 'package:flutter/material.dart';
import 'homescreen.dart'; // Import the file containing the HomeScreen

class LoginSuccessfulPage extends StatelessWidget {
  const LoginSuccessfulPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.orange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Login Successful!',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    // Navigate to HomeScreen
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Go to Home Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
