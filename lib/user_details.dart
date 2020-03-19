import 'package:flutter/material.dart';
import 'package:navigation_tests/main.dart';
import 'package:navigation_tests/models/chat.dart';
import 'package:navigation_tests/models/user.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  final User user;

  UserDetails(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Title: ${user.title}', style: Theme.of(context).textTheme.subtitle2,),
            RaisedButton(onPressed: () {
              final chatModel = Provider.of<ChatModel>(context, listen: false);
              final chat = chatModel.chats[3];
              // TODO Navigate to ChatMessages with the chat above
            }, child: Text('Start chat'),)
          ],
        ),
      ),
    );
  }
}
