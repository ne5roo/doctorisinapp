import 'package:flutter/material.dart';
import 'age_verification.dart'; // Ensure correct import of AgeVerificationPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Simulate a successful login
      print('Login successful');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AgeVerificationPage()),
      );
    } else {
      print('Form is not valid');
    }
  }

  void _forgotPassword() {
    // Handle the "Forgot Your Password?" logic here
    // For example, navigate to a password reset page or display a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Forgot Password'),
        content: const Text('Password reset link has been sent to your email.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE4B3),  // Light brown background color
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFFFEE4B3),  // Consistent AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login.png', // image for login (can change if better images or gif found)
                width: 150,
                height: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  // Regular expression for validating email
                  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Trigger login method
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEE4B3), // Match button color
                  elevation: 4, // Add elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black), // Add border
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _forgotPassword, // Trigger forgot password method
                child: const Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    color: Colors.black, // Set text color to black
                    decoration: TextDecoration.underline, // Underline the text
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
