import 'package:flutter/material.dart';
import 'package:navigation_tests/models/chat.dart';

class ChatMessages extends StatelessWidget {
  final Chat chat;

  ChatMessages(this.chat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chat.title),),
      body: ListView(
        reverse: true,
        children: chat.messages.map((chatMessage) =>
            ChatMessageLine(chatMessage)).toList(),
      ),
    );
  }
}

class ChatMessageLine extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageLine(this.chatMessage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              chatMessage.message,
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
