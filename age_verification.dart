import 'package:flutter/material.dart';

class AgeVerificationPage extends StatefulWidget {
  const AgeVerificationPage({super.key});

  @override
  _AgeVerificationPageState createState() => _AgeVerificationPageState();
}

class _AgeVerificationPageState extends State<AgeVerificationPage> { //different grades specified
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

  final List<String> _genders = ['Male', 'Female', 'Other']; //Try to add visual if needed?
  final List<String> _feelings = ['Happy', 'Sad', 'Sick', 'Angry', 'Nervous', 'Scared', 'Not Sure']; //Make this into emojis(?)

  String? _selectedGrade;
  String? _selectedGender;
  String? _selectedFeeling;
  String _errorMessage = '';

  // Function to check if all fields are selected and valid (edit so that error messages appear on the appropriate questions; please select grade error on all 3 questions as of the moment)
  bool _isValidForm() {
    if (_selectedGrade == null) {
      setState(() {
        _errorMessage = 'Please select your grade.';
      });
      return false;
    } else if (_selectedGender == null) {
      setState(() {
        _errorMessage = 'Please select your gender.';
      });
      return false;
    } else if (_selectedFeeling == null) {
      setState(() {
        _errorMessage = 'Please select how you are feeling.';
      });
      return false;
    } else {
      setState(() {
        _errorMessage = '';
      });
      return true;
    }
  }

  // Function to handle submission
  void _submit() {
    if (_isValidForm()) {
      // If all fields are selected, proceed to the next screen
      Navigator.pushReplacementNamed(context, '/main_page'); // Ensure to redirect to main page is defined in routes if valid info submitted
    } else {
      // Show error message if any field is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Age Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Please select your grade: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),  // Consistent adequate spacing between sections
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
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
            ),
            const SizedBox(height: 30),  // Increase spacing after grade selection
            const Text(
              'Please select your gender: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),  // Consistent adequate spacing before gender dropdown
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
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
            ),
            const SizedBox(height: 30),  // Increase spacing after gender selection
            const Text(
              'How are you feeling? ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),  // Consistent adequate spacing before feelings dropdown
            DropdownButtonFormField<String>(
              value: _selectedFeeling,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFeeling = newValue;
                });
              },
              items: _feelings.map<DropdownMenuItem<String>>((String feeling) {
                return DropdownMenuItem<String>(
                  value: feeling,
                  child: Text(feeling),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Feeling',
                hintText: 'How are you feeling?',
                border: const OutlineInputBorder(),
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
            ),
            const SizedBox(height: 40),  // Adequate spacing before the submit button
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}