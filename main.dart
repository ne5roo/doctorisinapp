import 'package:doctorisinapp/main_page.dart';
import 'package:doctorisinapp/payment_details.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage
import 'subscription_page.dart'; // Import the SubscriptionPage
import 'age_verification.dart'; // Import the AgeVerificationPage
import 'registration.dart'; // Import the RegistrationPage
import 'chatroom.dart'; // Import the ChatInterfacePage
import 'help_page.dart'; // Import the HelpPage
import 'settings_page.dart'; // Import the SettingsPage
import 'package:provider/provider.dart';
import 'providers/profile_image_provider.dart';
import 'providers/theme_provider.dart';

void main() async {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileImageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Add ThemeProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access ThemeProvider
    return MaterialApp(
      title: 'Doctor is in App',
      theme: themeProvider.currentTheme, // Use currentTheme
      home: const SplashScreen(), // Initial splash or subscription page
      routes: {
        '/ageVerification': (context) => const AgeVerificationPage(), // Age Verification
        '/home': (context) => const HomePage(), // Home Page after verification/login
        '/login': (context) => const LoginPage(), // Login Page
        '/register': (context) => const RegistrationPage(), // Registration Page
        '/payment': (context) => const PaymentFormPage(), // Updated Payment Form Page
        '/subscription': (context) => const SubscriptionPage(), // Subscription Page
        '/main_page': (context) => MainPage(), // Main Page after login
        '/chat': (context) => ChatInterfacePage(), // Chat Interface Page
        '/help': (context) => HelpPage(), // Help Page
        '/settings': (context) => SettingsPage(), // Settings Page
      },
    );
  }
}

// HomePage widget (add your home screen here)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access ThemeProvider
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(
            fontFamily: 'ComicSansMS', // Set font style to ComicSansMS
            fontWeight: FontWeight.bold, // Make the font bold
          ),
        ),
        backgroundColor: themeProvider.currentTheme.appBarTheme.backgroundColor, // Use currentTheme for AppBar background color
      ),
      body: Container(
        color: themeProvider.isDarkMode ? Colors.black : const Color(0xFFD0F0C0), // Apply background color
        child: const Center(
          child: Text('You are successfully verified and logged in!'),
        ),
      ),
    );
  }
}
