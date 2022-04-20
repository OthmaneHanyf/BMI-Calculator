import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'screens/results_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF182738),
            centerTitle: true,
          ),
          primaryColor: const Color(0xFF182738),
          scaffoldBackgroundColor: const Color(0xFF182738),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
            bodyText2: TextStyle(color: Color(0xFFFFFFFF)),
          )),
      home: InputScreen(),
    );
  }
}
