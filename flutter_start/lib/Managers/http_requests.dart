import 'dart:async';

import 'package:flutter_start/Managers/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> signUpAPI(User user) async {
  try {
    var response = await http.post(
      Uri.parse(
          'https://5a3883e3-69b9-4d95-a70c-81bfa22fbb32.mock.pstmn.io/planmymemory/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
      }),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return 'Request failed with status: ${response.statusCode}';
    }
  } catch (e) {
    return 'Error: $e';
  }
}

Future<String> signInAPI(String phone) async {
  try {
    var response = await http.post(
      Uri.parse(
          'https://5a3883e3-69b9-4d95-a70c-81bfa22fbb32.mock.pstmn.io/planmymemory/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone,
      }),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return 'Request failed with status: ${response.statusCode}';
    }
  } catch (e) {
    return 'Error: $e';
  }
}

// for get APIs
Future<String> getUserDetails(String phone) async {
  try {
    var response = await http.get(Uri.parse(
        'https://5a3883e3-69b9-4d95-a70c-81bfa22fbb32.mock.pstmn.io/planmymemory/user/$phone/details'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "yes";
    }
  } catch (e) {
    return "error";
  }
}
