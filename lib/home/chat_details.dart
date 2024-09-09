import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String avatarUrl;

  const ChatDetailPage({super.key, 
    required this.name,
    required this.avatarUrl,
  });

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<Map<String, String>> _messages = [
    {'text': 'How I can help you?', 'time': '7:22 AM', 'isMe': 'false'},
    {'text': 'I WANT SOME RENOVATIOON IDEAS', 'time': '7:22 AM', 'isMe': 'true'},
    {'text': 'okaaaaa', 'time': '7:23 AM', 'isMe': 'false'},
    {'text': 'Gggg', 'time': '7:57 AM', 'isMe': 'true'},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text;
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'time': TimeOfDay.now().format(context),
        'isMe': 'true',
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.avatarUrl),
            ),
            const SizedBox(width: 8),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (ctx, index) {
                final message = _messages[index];
                return MessageBubble(
                  isMe: message['isMe'] == 'true',
                  text: message['text']!,
                  time: message['time']!,
                );
              },
            ),
          ),
          ChatInputField(
            controller: _controller,
            sendMessage: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String text;
  final String time;

  const MessageBubble({super.key, 
    required this.isMe,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isMe ? Colors.green[100] : Colors.white,
          borderRadius: isMe
              ? const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
              : const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function sendMessage;

  const ChatInputField({super.key, 
    required this.controller,
    required this.sendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: const Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
              onSubmitted: (_) => sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => sendMessage(),
          ),
        ],
      ),
    );
  }
}
