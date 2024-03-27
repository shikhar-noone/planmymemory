import 'package:flutter/material.dart';

final globalUserState = UserState();

class User {
  String name;

  User({required this.name});
}

class UserState extends ChangeNotifier {
  User? _user;

  User? get user => _user;
  UserState();

  void createOrUpdateUser(String name) {
    if (_user == null) {
      _user = User(name: name);
    } else {
      _user!.name = name;
    }
    notifyListeners();
  }
}
