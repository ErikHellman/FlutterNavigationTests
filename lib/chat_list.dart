import 'package:flutter/material.dart';
import 'package:navigation_tests/models/chat.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatModel = Provider.of<ChatModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView(
        children: chatModel.chats.map((chat) => ChatItem(chat)).toList(),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  ChatItem(this.chat);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/chat', arguments: chat),
      child: Padding(
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
                chat.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
