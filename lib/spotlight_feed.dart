import 'package:flutter/material.dart';
import 'package:navigation_tests/models/user.dart';
import 'package:provider/provider.dart';

class SpotlightFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UsersModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Spotlight'),),
      body: ListView(
        children: userModel.users.map((user) => UserRow(user)).toList(),
      ),
    );
  }
}

class UserRow extends StatelessWidget {
  final User user;

  UserRow(this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/user', arguments: user),
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
                '${user.name}, ${user.title}',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
