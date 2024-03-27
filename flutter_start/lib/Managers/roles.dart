import 'package:flutter/material.dart';

class Roles extends ChangeNotifier {
  List<Role> roles = [];

  void addRole(Role role) {
    if (!roles.contains(role)) {
      roles.add(role);
      notifyListeners();
    }
  }

  void removeRole(Role role) {
    roles.remove(role);
    notifyListeners();
  }
}

class Role {
  factory Role.fromJson(Map<String, dynamic> json) {
    List<String> access = [];
    json["access"].forEach((acc) => access.add(acc));
    return Role(identifier: json["name"], access: access);
  }

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "access": access,
      };
  Role({required this.identifier, required this.access});
  String identifier;
  List<String> access;
}
