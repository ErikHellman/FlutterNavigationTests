import 'package:flutter/material.dart';

class User {
  final String name;
  final String title;

  User(this.name, this.title);

  @override
  String toString() {
    return 'User{name: $name, title: $title}';
  }
}

class UsersModel extends ChangeNotifier {
  List<User> _users = [];

  UsersModel() {
    _users = List.generate(15, (index) => User('User $index', 'Title $index'));
    notifyListeners();
  }

  List<User> get users => List.unmodifiable(_users);
}