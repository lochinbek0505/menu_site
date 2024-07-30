import 'package:flutter/material.dart';
import 'package:menu_application/sreens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Manrope',
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          colorScheme: ColorScheme.light(primary: Color(0xff2A5270))),
      home: HomePage(),
    );
  }
}
