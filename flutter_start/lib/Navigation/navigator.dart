import 'package:flutter/material.dart';
import 'package:flutter_start/HomePage/homepage.dart';
import 'package:flutter_start/HomePage/sign_in.dart';
import 'package:flutter_start/HomePage/sign_up.dart';
import 'package:flutter_start/HomePage/vendor_address.dart';
import 'package:flutter_start/HomePage/vendor_business.dart';
import 'package:flutter_start/Managers/authgaurd.dart';

import '../HomePage/onboarding_page.dart';

class UserNavigator extends StatefulWidget {
  const UserNavigator({super.key});
  @override
  State<UserNavigator> createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const OnboardingPage(),
    '/signup': (context) => const SignUpPage(),
    '/signin': (context) => const SignInPage(),
    '/vendor-address': (context) => const VendorAddressPage(),
    '/vendor-business': (context) => const VendorBusinessPage(),
    '/homepage': (context) => const AuthGuard(child: HomePage()),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}
