import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage and CustomBottomNavBar
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
          backgroundColor: Color(0xFFFEE4B3), // Consistent AppBar color
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
        title: const Text(
          'Help and Support',
          style: TextStyle(
            fontFamily: 'ComicSansMS', // Set font to ComicSansMS
            fontWeight: FontWeight.bold, // Make the font bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'About Us!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Here you can find information about this app.',
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox(height: 20),
              const Text(
                'The Doctor is in App is an application that connects you to a health professional for any sort of health concern.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'We are here to support you in any ways that we can. If you need to just talk to someone, use our chat feature to chat with someone.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              const Text(
                'FAQs (Frequently Asked Questions):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              faqItem(Icons.help_outline, 'Account setup and login issues'),
              faqItem(Icons.payment, 'Payment or subscription-related questions'),
              faqItem(Icons.bug_report, 'Troubleshooting steps for common bugs'),
              faqItem(Icons.info_outline, 'How-to-guides for app features'),
              const SizedBox(height: 20),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              const Text(
                'Contact Support:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              contactItem(Icons.email, 'Email support: info@ekidspower.com'),
              contactItem(Icons.phone, 'Phone support: 1-415-378-6789'),
              const SizedBox(height: 20),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse('https://www.ekidspowerup.com/');
                    if (!await launchUrl(url)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Could not launch URL')),
                      );
                    }
                  },
                  child: const Text(
                    'For further information, visit our website by clicking here!',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

Widget faqItem(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Widget contactItem(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
