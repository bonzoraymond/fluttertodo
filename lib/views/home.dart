import 'package:flutter/material.dart';
// Import login screen
// Import dashboard screen
import 'package:dart_application_1/views/registration.dart'; // Import registration screen

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()),
            );
          },
          child: const Text('Go to Registration Screen'),
        ),
      ),
    );
  }
}
