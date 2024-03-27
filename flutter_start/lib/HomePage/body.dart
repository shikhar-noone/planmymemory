import 'package:flutter/material.dart';
import 'package:flutter_start/Managers/user.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingForm();
  }
}

// Create a Form widget.
class OnboardingForm extends StatefulWidget {
  const OnboardingForm({super.key});

  @override
  OnboardingFormState createState() {
    return OnboardingFormState();
  }
}

class OnboardingFormState extends State<OnboardingForm> {
  User? user;
  @override
  Widget build(BuildContext context) {
    return const Text("Home page data");
  }
}
