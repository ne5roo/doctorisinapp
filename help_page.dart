import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage

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
        title: Text('About Us'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help and Support!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Here you can find information about this app.', //need to add more details such as emergency contact numbers
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'The Doctor is in App is an application that connects you to a health professional for any sort of health problem.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'We are here to support you in any ways that we can. If you need to just talk to someone, use our chat feature to chat with someone.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'For further information click this link! https://www.ekidspowerup.com/',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
