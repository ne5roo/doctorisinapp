import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage
import 'subscription_page.dart'; // Import the SubscriptionPage
import 'age_verification.dart'; // Import the AgeVerificationPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor is in App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set SubscriptionPage as the initial screen (home)
      home: const SplashScreen(),
      routes: {
        '/ageVerification': (context) => const AgeVerificationPage(), // Route to AgeVerificationPage
        '/home': (context) => const HomePage(), // After age verification or successful login
        '/login': (context) => const LoginPage(), // Route to LoginPage
      },
    );
  }
}

// HomePage widget (add your home screen here)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: const Center(
        child: Text('You are successfully verified and logged in!'),
      ),
    );
  }
}
