import 'package:flutter/material.dart';

class AgeVerificationPage extends StatefulWidget {
  const AgeVerificationPage({super.key});

  @override
  _AgeVerificationPageState createState() => _AgeVerificationPageState();
}

class _AgeVerificationPageState extends State<AgeVerificationPage> {
  // List of grades to display in the dropdown
  final List<String> _grades = [
    'Kindergarten',
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
    'Grade 6',
    'Grade 7',
    'Grade 8',
    'Grade 9',
    'Grade 10',
    'Grade 11',
    'Grade 12',
  ];

  // List of genders to display in the dropdown
  final List<String> _genders = ['Male', 'Female', 'Other'];

  // List of feelings with corresponding emojis
  final List<Map<String, String>> _feelings = [
    {'label': 'Happy', 'emoji': '😊'},
    {'label': 'Sad', 'emoji': '😢'},
    {'label': 'Sick', 'emoji': '🤒'},
    {'label': 'Angry', 'emoji': '😠'},
    {'label': 'Nervous', 'emoji': '😨'},
    {'label': 'Scared', 'emoji': '😱'},
    {'label': 'Not Sure', 'emoji': '😕'},
  ];

  // Variables to hold the selected values for grade, gender, and feeling
  String? _selectedGrade;
  String? _selectedGender;
  String? _selectedFeeling;

  // Variables to hold the error messages for each field
  String? _gradeErrorMessage;
  String? _genderErrorMessage;
  String? _feelingErrorMessage;

  // Function to check if the form is valid
  bool _isValidForm() {
    bool isValid = true;

    // Check if a grade is selected, if not, show an error message
    if (_selectedGrade == null) {
      setState(() {
        _gradeErrorMessage = 'Please select your grade.';
      });
      isValid = false;
    } else {
      setState(() {
        _gradeErrorMessage = null;
      });
    }

    // Check if a gender is selected, if not, show an error message
    if (_selectedGender == null) {
      setState(() {
        _genderErrorMessage = 'Please select your gender.';
      });
      isValid = false;
    } else {
      setState(() {
        _genderErrorMessage = null;
      });
    }

    // Check if a feeling is selected, if not, show an error message
    if (_selectedFeeling == null) {
      setState(() {
        _feelingErrorMessage = 'Please select how you are feeling.';
      });
      isValid = false;
    } else {
      setState(() {
        _feelingErrorMessage = null;
      });
    }

    return isValid;
  }

  // Function to handle form submission
  void _submit() {
    // If the form is valid, navigate to the next screen
    if (_isValidForm()) {
      Navigator.pushReplacementNamed(context, '/main_page');
    } else {
      // If the form is not valid, show an error message using a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the AppBar title
      appBar: AppBar(title: const Text('Age Verification')),

      // Set the background color for the entire page (soft yellow color)
      backgroundColor: const Color(0xFFFEE4B3),

      // Main body of the page wrapped in a Padding widget for spacing
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Text prompt for selecting grade
            const Text(
              'Please select your grade: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20), // Space between elements

            // Dropdown for selecting grade
            DropdownButtonFormField<String>(
              value: _selectedGrade,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGrade = newValue;
                });
              },
              items: _grades.map<DropdownMenuItem<String>>((String grade) {
                return DropdownMenuItem<String>(
                  value: grade,
                  child: Text(grade),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Grade',
                hintText: 'Choose your grade',
                border: const OutlineInputBorder(),
                errorText: _gradeErrorMessage, // Show error message if any
              ),
            ),
            const SizedBox(height: 30), // Space between elements

            // Text prompt for selecting gender
            const Text(
              'Please select your gender: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20), // Space between elements

            // Dropdown for selecting gender
            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: _genders.map<DropdownMenuItem<String>>((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Gender',
                hintText: 'Choose your gender',
                border: const OutlineInputBorder(),
                errorText: _genderErrorMessage, // Show error message if any
              ),
            ),
            const SizedBox(height: 30), // Space between elements

            // Text prompt for selecting feeling
            const Text(
              'How are you feeling? ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20), // Space between elements

            // Dropdown for selecting feeling with emojis
            DropdownButtonFormField<String>(
              value: _selectedFeeling,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFeeling = newValue;
                });
              },
              items: _feelings.map<DropdownMenuItem<String>>((Map<String, String> feeling) {
                return DropdownMenuItem<String>(
                  value: feeling['label'],
                  child: Row(
                    children: [
                      Text(feeling['emoji']!), // Display emoji next to label
                      const SizedBox(width: 10), // Space between emoji and text
                      Text(feeling['label']!), // Display the feeling label
                    ],
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Feeling',
                hintText: 'How are you feeling?',
                border: const OutlineInputBorder(),
                errorText: _feelingErrorMessage, // Show error message if any
              ),
            ),
            const SizedBox(height: 40), // Space before the submit button

            // Submit button with the same background color as the page
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEE4B3), // Set button background color same as the page
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
