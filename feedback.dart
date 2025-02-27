import 'package:flutter/material.dart'; // Severely Incomplete have not polished yet need to integrate after summary page
import 'main_page.dart'; // Import MainPage

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();
  double _rating = 3.0;

  // Function to handle feedback submission
  void _submitFeedback() {
    if (_formKey.currentState?.validate() ?? false) {
      // If form is valid, display a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted!')),
      );

      // Optionally, you can clear the fields after submission
      _feedbackController.clear();
      setState(() {
        _rating = 3.0; // Reset the rating
      });

      // Navigate back to MainPage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Page'),
        centerTitle: true, // Center the AppBar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We would love to hear your feedback!',
                style: Theme.of(context).textTheme.titleLarge, // Updated here
              ),
              const SizedBox(height: 20),

              // Feedback Text Field
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Put your Feed back Here....',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some feedback';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Rating as Stars
              const Text('Rate your experience:'),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: index < _rating ? Colors.amber[700] : Colors.amber[300],
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEE4B3), // Match button color
                  elevation: 4, // Add elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black), // Add border
                  ),
                ),
                child: const Text(
                  'Submit Feedback',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
