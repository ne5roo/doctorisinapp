import 'package:doctorisinapp/main_page.dart';
import 'package:doctorisinapp/payment_details.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage
import 'subscription_page.dart'; // Import the SubscriptionPage
import 'age_verification.dart'; // Import the AgeVerificationPage
import 'registration.dart'; // Import the RegistrationPage

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
        // Set AppBar theme globally
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFEE4B3), // Custom color for AppBar
        ),
        // Set Scaffold background color globally
        scaffoldBackgroundColor: const Color(0xFFFEE4B3), // Custom color for page background
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),  // Corrected text theme
          bodyMedium: TextStyle(color: Colors.black), // Corrected text theme
          bodySmall: TextStyle(color: Colors.black),  // Corrected text theme
        ),
      ),
      home: const SplashScreen(), // Initial splash or subscription page
      routes: {
        '/ageVerification': (context) => const AgeVerificationPage(), // Age Verification
        '/home': (context) => const HomePage(), // Home Page after verification/login
        '/chat': (context) => const ChatInterfacePage(), // Chat Interface Page
        '/login': (context) => const LoginPage(), // Login Page
        '/register': (context) => const RegistrationPage(), // Registration Page
        '/payment': (context) => const PaymentFormPage(), // Updated Payment Form Page
        '/subscription': (context) => const SubscriptionPage(), // Subscription Page
        '/main_page': (context) => MainPage(), // Main Page after login
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
