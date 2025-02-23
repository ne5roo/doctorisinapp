import 'package:flutter/material.dart';

class ChatInterfacePage extends StatefulWidget {
  const ChatInterfacePage({Key? key}) : super(key: key);

  @override
  _ChatInterfacePageState createState() => _ChatInterfacePageState();
}

class _ChatInterfacePageState extends State<ChatInterfacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE4B3),  // Applying your custom color here
      appBar: AppBar(
        title: const Text('The Doctor Is In Summary'),
        backgroundColor: const Color(0xFFFEE4B3),  // Applying your custom color to the AppBar
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFFFEE4B3).withOpacity(0.3),  // Lighter shade for container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Advices:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('• Talk to your friend before making decisions'),
                Text('• After the whole picture is completed, make your decision'),
                Text('• It is important to listen first'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ChatInterfacePage(),
  ));
}
