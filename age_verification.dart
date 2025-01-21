import 'package:flutter/material.dart';

class AgeVerificationPage extends StatefulWidget {
  const AgeVerificationPage({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _AgeVerificationPageState createState() => _AgeVerificationPageState();
}


class _AgeVerificationPageState extends State<AgeVerificationPage> {
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


  String? _selectedGrade;


  String _errorMessage = '';


  // Function to check if the grade is selected and valid
  bool _isValidGrade() {
    if (_selectedGrade == null) {
      setState(() {
        _errorMessage = 'Please select your grade.';
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
    if (_isValidGrade()) {
      // If grade is selected, proceed to next screen ( CONNECT THIS PAGE TO Main App Screen)
      Navigator.pushReplacementNamed(context, '/home');  // Adjust route as needed
    } else {
      // Show error message if grade is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorMessage)),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grade Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please select your grade: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 20),
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
