import 'package:doctorisinapp/profile_page.dart';
import 'package:flutter/material.dart';
import 'chatroom.dart'; // Import the ChatInterfacePage
import 'help_page.dart'; // Import the HelpPage
import 'settings_page.dart'; // Import the SettingsPage

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
          backgroundColor: Color(0xFFFEE4B3),
        ),
        scaffoldBackgroundColor: Color(0xFFFEE4B3),
      ),
      home: const MainPage(),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/help': (context) => const HelpPage(),
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out')),
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
              Navigator.pushNamed(context, '/profile');
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
        title: const Text('Welcome to the Doctor is in App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Animation - 1738296418740.gif', //animation input can change when a better one is found
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat'); // Redirect to chatroom
              },
              child: const Text('Start Chatting Here!'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
