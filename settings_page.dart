// connect with main page and add more features for usability 
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Initial theme is light mode
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
              items: voiceOptions.map<DropdownMenuItem<String>>((String value) {
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
              // Change the app theme based on the switch
              if (_isDarkMode) {
                // Use dark theme
                _changeTheme(ThemeData.dark());
              } else {
                // Use light theme
                _changeTheme(ThemeData.light());
              }
            },
          ),
        ],
      ),
    );
  }

  // Function to change theme by rebuilding the entire app
  void _changeTheme(ThemeData themeData) {
    runApp(MyAppWithTheme(themeData));
  }
}

class MyAppWithTheme extends StatelessWidget {
  final ThemeData themeData;

  MyAppWithTheme(this.themeData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData, // Apply the provided theme (light or dark)
      home: SettingsPage(),
    );
  }
}
