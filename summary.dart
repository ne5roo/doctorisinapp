import 'package:flutter/material.dart';
import 'feedback.dart'; // Import the FeedbackPage

class SummaryPage extends StatelessWidget {
  final List<Map<String, String>> messages;

  const SummaryPage({super.key, required this.messages});

  List<String> _generateSummary(List<Map<String, String>> messages) {
    return messages
        .where((message) => message['sender'] == 'doctor')
        .map((message) => message['text']!)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final summary = _generateSummary(messages);

    return Scaffold(
      backgroundColor: const Color(0xFFD0F0C0),  // Applying your custom color here
      appBar: AppBar(
        title: const Text(
          'The Doctor Is In Summary',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            fontStyle: FontStyle.italic, 
            fontFamily: 'ComicSansMS' // Change font style to ComicSansMS
          ), 
        ),
        centerTitle: true, // Center the AppBar title
        backgroundColor: const Color(0xFFD0F0C0),  // Applying your custom color to the AppBar
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,  // Lighter shade for container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Summary of Advice:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...summary.map((advice) => Text(
                          '• $advice',
                          style: const TextStyle(fontSize: 22),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.white, // Match button color
                  elevation: 4, // Add elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black), // Add border
                  ),
                ),
                child: const Text(
                  'OK',
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

