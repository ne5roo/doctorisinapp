import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage
import 'subscription_page.dart'; // Import the SubscriptionPage
import 'age_verification.dart'; // Import the AgeVerificationPage
import 'registration.dart'; // Import the RegistrationPage
import 'payment_details.dart'; // Import the PaymentFormPage

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
      home: const SplashScreen(), // Initial splash or subscription page
      routes: {
        '/ageVerification': (context) => const AgeVerificationPage(), // Age Verification
        '/home': (context) => const HomePage(), // Home Page after verification/login
        '/login': (context) => const LoginPage(), // Login Page
        '/register': (context) => const RegistrationPage(), // Registration Page
        '/payment': (context) => const PaymentFormPage(), // Payment Form Page
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
