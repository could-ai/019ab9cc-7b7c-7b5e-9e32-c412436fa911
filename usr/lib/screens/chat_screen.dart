import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hello! I am CouldAI. How can I help you today?',
      'isUser': false,
      'time': DateTime.now().subtract(const Duration(minutes: 5)),
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = _messageController.text;
    setState(() {
      _messages.add({
        'text': userMessage,
        'isUser': true,
        'time': DateTime.now(),
      });
      _messageController.clear();
    });

    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _messages.add({
            'text': 'I received your message: "$userMessage". As an AI demo, I can\'t process complex requests yet, but I\'m listening!',
            'isUser': false,
            'time': DateTime.now(),
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final msg = _messages[index];
              final isUser = msg['isUser'] as bool;
              return Align(
                alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
                      bottomRight: isUser ? Radius.zero : const Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    msg['text'] as String,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                    filled: false,
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              IconButton(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
