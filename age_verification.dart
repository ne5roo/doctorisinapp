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
  final List<String> _genders = ['Male', 'Female', 'Other', 'Unsure'];

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

    if (_selectedGrade == null) {
      setState(() => _gradeErrorMessage = 'Please select your grade.');
      isValid = false;
    } else {
      setState(() => _gradeErrorMessage = null);
    }

    if (_selectedGender == null) {
      setState(() => _genderErrorMessage = 'Please select your gender.');
      isValid = false;
    } else {
      setState(() => _genderErrorMessage = null);
    }

    if (_selectedFeeling == null) {
      setState(() => _feelingErrorMessage = 'Please select how you are feeling.');
      isValid = false;
    } else {
      setState(() => _feelingErrorMessage = null);
    }

    return isValid;
  }

  // Function to handle form submission
  void _submit() {
    if (_isValidForm()) {
      Navigator.pushReplacementNamed(context, '/main_page');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Verification'),
        backgroundColor: const Color(0xFFFEE4B3),  // Set AppBar color same as the background
        elevation: 0,  // Optional: To remove the shadow under the app bar
      ),
      backgroundColor: const Color(0xFFFEE4B3),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Display GIF instead of Lottie animation
            Center(
              child: Image.asset(
                'assets/checklist.gif',  // Replace with GIF path
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20), // Space between the animation and text

            const Text(
              'Select your grade: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedGrade,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGrade = newValue;
                });
              },
              items: _grades.map((String grade) {
                return DropdownMenuItem<String>( 
                  value: grade,
                  child: Text(grade),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Grade',
                hintText: 'Choose your grade',
                border: const OutlineInputBorder(),
                errorText: _gradeErrorMessage,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Select your gender: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: _genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Gender',
                hintText: 'Choose your gender',
                border: const OutlineInputBorder(),
                errorText: _genderErrorMessage,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'How are you feeling? ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedFeeling,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFeeling = newValue;
                });
              },
              items: _feelings.map((Map<String, String> feeling) {
                return DropdownMenuItem<String>(
                  value: feeling['label'],
                  child: Row(
                    children: [
                      Text(feeling['emoji']!),
                      const SizedBox(width: 10),
                      Text(feeling['label']!),
                    ],
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Feeling',
                hintText: 'How are you feeling?',
                border: const OutlineInputBorder(),
                errorText: _feelingErrorMessage,
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEE4B3), // Match button color
                elevation: 4, // Add elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black), // Add border
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
