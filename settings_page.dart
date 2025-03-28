import 'package:doctorisinapp/subscription_page.dart';
import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = false;
  String _selectedVoice = 'Male';

  // Voice options list
  final List<String> voiceOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access ThemeProvider
    return MaterialApp(
      theme: themeProvider.currentTheme, // Use currentTheme
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'ComicSansMS', // Set font to ComicSansMS
              fontWeight: FontWeight.bold, // Make the font bold
            ),
          ),
          centerTitle: true, // Center the AppBar title
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              ); // Redirect to main page
            },
          ),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : const Color(0xFFD0F0C0), // Apply background color
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Notification toggle switch
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),

            // Voice Option selection
            ListTile(
              title: Text('Voice Option'),
              subtitle: Text(_selectedVoice),
              trailing: DropdownButton<String>(
                value: _selectedVoice,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedVoice = newValue!;
                  });
                },
                items:
                    voiceOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            // Dark Mode toggle switch
            SwitchListTile(
              title: Text('Enable Dark Mode'),
              value: themeProvider.isDarkMode, // Use ThemeProvider's state
              onChanged: (bool value) {
                themeProvider.toggleDarkMode(value); // Update ThemeProvider
              },
            ),
            const SizedBox(height: 20), // Add some space before the logout button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout logic here
                  print('Logout successful');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SubscriptionPage()),
                  );
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
                  'Logout',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
