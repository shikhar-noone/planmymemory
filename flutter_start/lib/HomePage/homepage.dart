import 'package:flutter/material.dart';
import 'package:flutter_start/HomePage/header.dart';
import 'package:flutter_start/Managers/user.dart';
import 'package:flutter_start/Navigation/side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String userName =
        globalUserState.user == null ? "" : globalUserState.user!.name;
    return Scaffold(
        appBar: AppBar(
          title: const HomeHeader(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Expanded(child: HomeSideBar()),
            Expanded(
                child: Row(
              children: [
                Text("Welcome $userName to plan my memory!"),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text("Sign Up"),
                )
              ],
            )),
          ],
        ));
  }
}
