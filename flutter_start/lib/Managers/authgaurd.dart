import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_start/HomePage/sign_in.dart';
import 'package:flutter_start/Managers/http_requests.dart';
import 'package:flutter_start/Managers/user.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final sessionManager = SessionManager();
    Future<dynamic> accessToken = sessionManager.get("token");
    dynamic route;
    accessToken.then((value) {
      if (value == null) {
        route = const SignIn();
      } else if (globalUserState.user == null) {
        Future<dynamic> phone = sessionManager.get("phone");
        phone.then((val) {
          getUserDetails(val.toString()).then((res) {
            Map<String, dynamic> jsonMap = json.decode(res);
            globalUserState.createOrUpdateUser(jsonMap["user"]["name"]);
          });
          route = child;
        });
      }
    });

    return route ?? child;
  }
}
