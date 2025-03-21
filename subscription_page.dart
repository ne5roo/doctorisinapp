import 'package:flutter/material.dart';
import 'dart:async'; // For adding a delay
import 'login.dart'; // Ensure correct import of LoginPage
import 'registration.dart'; // Ensure correct import of RegistrationPage
import 'package:loading_animation_widget/loading_animation_widget.dart'; // Import the loading animation package

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadApp();
  }

  // Simulate a delay to show the loading screen
  _loadApp() async {
    await Future.delayed(const Duration(seconds: 2)); // Show splash screen for 2 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SubscriptionPage()), // Navigate to SubscriptionPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0F0C0), // Set a background color matching your theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image to display on splash screen with a bigger size
            Image.asset(
              'assets/ekids1.png', // Ensure your image is in the assets folder
              height: 350, // Adjust the height to make the image bigger
              width: 350,  // Adjust the width as well
            ),
            const SizedBox(height: 20),
            // New Loading Animation
            LoadingAnimationWidget.fourRotatingDots(
              color: Colors.black, // Set the color of the loading animation
              size: 75,
            ),
            const SizedBox(height: 20),
            const Text(
              'Loading...',
              style: TextStyle(color: Colors.black, fontSize: 20), // Text style matching your app theme
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Section 1
              Image.asset(
                'assets/ekids1.png', // Ensure your logo image is in the assets folder
                height: 400,
                width: 400,
              ),
              const SizedBox(height: 10), // Reduce the spacing here
              const Text(
                'Welcome to Doctor is In! Scroll down to choose a package that suits your needs.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10), // Reduce the spacing here
              const Text(
                '© All rights reserved by ekidsPower-Up, Inc.',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10), // Add spacing below the italic text
              _buildGreenButton(
                context,
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
              const SizedBox(height: 250), // Add more space here
              // Section 2
              const Text(
                'Choose Your Subscription Package',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'ComicSansMS'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildPackageCard(
                    context,
                    title: 'Bronze Package',
                    price: '\$17.50/month',
                    features: ['3 Months Access'],
                    imagePath: 'assets/bronze_package.png',
                    onPressed: () {
                      _selectPackage(context, 'Bronze Package');
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildPackageCard(
                    context,
                    title: 'Silver Package',
                    price: '\$35/month',
                    features: ['6 Months Access'],
                    imagePath: 'assets/silver_package.png',
                    onPressed: () {
                      _selectPackage(context, 'Silver Package');
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildPackageCard(
                    context,
                    title: 'Gold Package',
                    price: '\$70/month',
                    features: ['1 Year Access'],
                    imagePath: 'assets/gold_package.png',
                    onPressed: () {
                      _selectPackage(context, 'Gold Package');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFD0F0C0),
    );
  }

  Widget _buildGreenButton(BuildContext context, {required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Change button color to white
        elevation: 4, // Add elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.black), // Add border
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black), // Set text color to black
      ),
    );
  }

  Widget _buildPackageCard(
    BuildContext context, {
    required String title,
    required String price,
    required List<String> features,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed, // Handle tap on the entire card
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      price,
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    const SizedBox(height: 10),
                    ...features.map((feature) => Text('- $feature')),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectPackage(BuildContext context, String packageName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selected Package'),
        content: Text('You have selected the $packageName.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegistrationPage()),
              ); // Navigate to RegistrationPage
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
