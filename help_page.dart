import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Help Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD0F0C0), // Consistent AppBar color
        ),
      ),
      home: HelpPage(), // Directly displaying the HelpPage
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'), // AppBar title
        leading: IconButton(
          icon: Icon(Icons.arrow_back),  // Can change this icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            ); // Redirect to main page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Allow scrolling for better usability
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'About Us!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Here you can find information about this app.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Text(
                'The Doctor is in App is an application that connects you to a health professional for any sort of health problem.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 10),
              Text(
                'We are here to support you in any ways that we can. If you need to just talk to someone, use our chat feature to chat with someone.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              SizedBox(height: 10),
              Text(
                'FAQs (Frequently Asked Questions):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.help_outline, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Account setup and login issues',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.payment, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Payment or subscription-related questions',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.bug_report, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Troubleshooting steps for common bugs',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'How-to-guides for app features',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              SizedBox(height: 10),
              Text(
                'Contact Support:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Email support: info@ekidspower.com',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Phone support: 1-415-378-6789',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Redirect to the website
                    launchUrl(Uri.parse('https://www.ekidspowerup.com/'));
                  },
                  child: Text(
                    'For further information, visit our website!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
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
