import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = false;
  String _selectedVoice = 'Male';
  bool _isDarkMode = false; // To track dark mode status

  // Voice options list
  final List<String> voiceOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFFD0F0C0), // Consistent AppBar color
              ),
              scaffoldBackgroundColor: Color(0xFFD0F0C0), // Matches MainPage
            ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
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
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
