import 'package:flutter/material.dart';

class Chat {
  final String title;
  final List<ChatMessage> messages;

  Chat(this.title, this.messages);

  @override
  String toString() {
    return 'Chat{title: $title, messages: $messages}';
  }
}

class ChatMessage {
  final String message;

  ChatMessage(this.message);

  @override
  String toString() {
    return 'ChatMessage{message: $message}';
  }
}

class ChatModel extends ChangeNotifier {
  List<Chat> _chats = [];

  ChatModel() {
    _chats = List.generate(10, (index) {
      final messages = List.generate(15, (i) => ChatMessage('Message $i in chat $index'));
      return Chat('Chat $index', messages);
    });
    notifyListeners();
  }

  List<Chat> get chats => List.unmodifiable(_chats);
}