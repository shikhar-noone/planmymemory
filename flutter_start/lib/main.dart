import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:flutter_start/Navigation/navigator.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter bindings are initialized
  // await initPathProvider();
  runApp(const MyApp());
}

// Future<void> initPathProvider() async {
//   await getApplicationSupportDirectory(); // Initialize path_provider plugin
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserNavigator();
  }
}
