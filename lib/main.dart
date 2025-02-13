import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_matrimony_app/screens/welcome_back_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_){runApp(const MyApp());});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Matrimony App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeBackScreen(),
    );
  }
}

