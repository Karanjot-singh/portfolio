import 'package:flutter/material.dart';
import './profile_page.dart';

//https://flutter.dev/docs/get-started/web
//
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        fontFamily: "Montserrat-Bold",
      ),
      home: ProfilePage(),
    );
  }
}