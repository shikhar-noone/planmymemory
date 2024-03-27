import 'package:flutter/material.dart';
import 'package:flutter_start/css/button.dart';
import 'package:flutter_start/css/text.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Opacity(
          opacity: 0.6,
          child: Image.asset(
            "lib/images/sadi_3.jpeg", // Replace with your image path
            fit: BoxFit.cover,
          )),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text(
                  "Sign In",
                  style: MyTextStyle.bodyStyle,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                const Text(
                  "Not a member, Please ",
                  style: MyTextStyle.bodyStyle,
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    "Sign Up",
                    style: CustomButtonStyle.bodyStyle,
                  ),
                )
              ])
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
        ],
      )
    ]));
  }
}
