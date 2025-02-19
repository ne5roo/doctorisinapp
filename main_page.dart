import 'package:doctorisinapp/profile_page.dart';
import 'package:flutter/material.dart';
import 'chatroom.dart'; // Import the ChatInterfacePage
import 'help_page.dart'; // Import the HelpPage
import 'settings_page.dart'; // Import the SettingsPage
import 'login.dart'; // Import the LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFEE4B3), // Consistent AppBar color
        ),
        scaffoldBackgroundColor: Color(0xFFFEE4B3),
      ),
      home: const MainPage(),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/help': (context) =>  HelpPage(),
        '/chat': (context) => const ChatInterfacePage(), // Add the chat route
      },
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.exit_to_app), // Logout Icon
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings), // Settings Icon
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline), // Help Icon
            onPressed: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person), // Profile Icon
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Doctor is in App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Chatting.png', //animation input can change when a better one is found
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat'); // Redirect to chatroom
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEE4B3), // Match button color
                elevation: 4, // Add elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black), // Add border
                ),
              ),
              child: const Text(
                'Start Chatting Here!',
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
