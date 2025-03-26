import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'summary.dart';
import 'providers/profile_image_provider.dart';
import 'api/gemini_api_service.dart';

class ChatInterfacePage extends StatefulWidget {
  const ChatInterfacePage({super.key});

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

  final List<String> _emojis = [
     '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆', '😉', '😊', '😋', '😎', '😍', '😘', '🥰', '😗', '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐', '😑', '😶', '🙄', '😏', '😣', '😥', '😮', '🤐', '😯', '😪', '😫', '🥱', '😴', '😌', '😛', '😜', '😝', '🤤', '😒', '😓', '😔', '😕', '🙃', '🤑', '😲', '☹️', '🙁', '😖', '😞', '😟', '😤', '😢', '😭', '😦', '😧', '😨', '😩', '🤯', '😬', '😰', '😱', '🥵', '🥶', '😳', '🤪', '😵', '😡', '😠', '🤬', '😷', '🤒', '🤕', '🤢', '🤮', '🤧', '😇', '🥳', '🥺', '🤠', '🤡', '🤥', '🤫', '🤭', '🧐', '🤓', '😈', '👿', '👹', '👺', '💀', '👻', '👽', '👾', '🤖', '🎃', '😺', '😸', '😹', '😻', '😼', '😽', '🙀', '😿', '😾'
  ];

  final GeminiApiService geminiApiService = GeminiApiService(apiKey: 'AIzaSyAUKaPSnbTLdcXcvegsD-nwACL9rtqAXWs');

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': _controller.text.trim()});
      _isTyping = true;
      _showEmojis = false;
    });

    String botResponse = await geminiApiService.getResponse(_controller.text.trim());

    setState(() {
      _messages.add({'sender': 'doctor', 'text': botResponse});
      _isTyping = false;
    });

    _controller.clear();
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
    final profileImageUrl = Provider.of<ProfileImageProvider>(context).profileImageUrl;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The Doctor Is In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'ComicSansMS',
              ),
            ),
            const SizedBox(width: 8),
            Image.asset('assets/ekids1.png', height: 55, width: 55),
          ],
        ),
        backgroundColor: const Color(0xFFD0F0C0),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              final doctorMessages = _messages
                  .where((message) => message['sender'] == 'doctor')
                  .toList();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryPage(messages: doctorMessages),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFD0F0C0),
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
                      child: Text('...Typing',
                          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
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
                      child: MarkdownBody(
                        data: message['text']!,
                        selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    if (isUser)
                      CircleAvatar(
                        backgroundImage: AssetImage(profileImageUrl),
                        radius: 18,
                      ),
                  ],
                );
              },
            ),
          ),
          if (_showEmojis)
            Container(
              height: 250,
              color: Colors.white,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                itemCount: _emojis.length,
                itemBuilder: (context, index) {
                  return IconButton(
                    onPressed: () {
                      _addEmojiToMessage(_emojis[index]);
                    },
                    icon: Text(_emojis[index]),
                  );
                },
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
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  child: const Text('Send', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
