import 'package:doctorisinapp/profile_page.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), // Add border radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Remove the logout button
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
        title: const Text(
          'Welcome!',
          style: TextStyle(
            fontFamily: 'ComicSansMS', // Apply the custom font
            fontWeight: FontWeight.bold, // Make the font bold
            fontSize: 24,
          ),
        ),
        centerTitle: true, // Center the AppBar title
        automaticallyImplyLeading: false, // Remove the back button
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
                backgroundColor: Colors.white, // Match button color
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
