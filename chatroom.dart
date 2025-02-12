import 'package:flutter/material.dart';

class ChatInterfacePage extends StatefulWidget {
  const ChatInterfacePage({Key? key}) : super(key: key);

  @override
  _ChatInterfacePageState createState() => _ChatInterfacePageState();
}

class _ChatInterfacePageState extends State<ChatInterfacePage> {
  final List<Map<String, String>> _messages = [
    {'sender': 'doctor', 'text': 'Hi! How can I help you today?'},
  ];

  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;
  bool _showEmojis = false;

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'sender': 'user',
        'text': _controller.text.trim(),
      });
      _isTyping = true;

      // Simulate a typing delay for the doctor
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _messages.add({
            'sender': 'doctor',
            'text': _generateBotResponse(_controller.text.trim()),
          });
          _isTyping = false;
        });
      });
    });

    _controller.clear();
  }

  String _generateBotResponse(String userMessage) {
    // Simple AI bot logic for demonstration purposes
    if (userMessage.contains('sad') || userMessage.contains('depressed')) {
      return 'I\'m sorry to hear that. It\'s important to talk to someone who can help. Have you considered speaking to a therapist?';
    } else if (userMessage.contains('headache') || userMessage.contains('pain')) {
      return 'I\'m sorry you\'re experiencing pain. Make sure to rest and stay hydrated. If the pain persists, please consult a doctor.';
    } else {
      return 'Thank you for sharing that. Let’s talk more about it.';
    }
  }

  void _toggleEmojis() {
    setState(() {
      _showEmojis = !_showEmojis;
    });
  }

  void _addEmojiToMessage(String emoji) {
    _controller.text += emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Doctor Is In Now Chatting'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '...Typing',
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                    ),
                  );
                }

                final message = _messages[index];
                final isUser = message['sender'] == 'user';

                return Row(
                  mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/doctor_avatar.png'),
                        radius: 18,
                      ),
                    const SizedBox(width: 8),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        message['text']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    if (isUser)
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/user_avatar.png'),
                        radius: 18,
                      ),
                  ],
                );
              },
            ),
          ),
          if (_showEmojis)
            SizedBox(
              height: 250,
              child: GridView.count(
                crossAxisCount: 8,
                children: [
                  '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆',
                  '😉', '😊', '😋', '😎', '😍', '😘', '😗', '😙',
                  '😚', '🙂', '🤗', '🤔', '😐', '😑', '😶', '🙄',
                  '😏', '😣', '😥', '😮', '🤐', '😯', '😪', '😫',
                  '😴', '😌', '😛', '😜', '😝', '🤤', '😒', '😓',
                  '😔', '😕', '🙃', '🤑', '😲', '☹️', '🙁', '😖',
                  '😞', '😟', '😤', '😢', '😭', '😦', '😧', '😨',
                  '😩', '😬', '😰', '😱', '😳', '😵', '😡', '😠',
                  '😷', '🤒', '🤕', '🤢', '🤧', '😇', '🤠', '🤡',
                ].map((emoji) {
                  return GestureDetector(
                    onTap: () => _addEmojiToMessage(emoji),
                    child: Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
                  );
                }).toList(),
              ),
            ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: _toggleEmojis,
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type in your message...',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                  color: Colors.blue,
                ),
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
