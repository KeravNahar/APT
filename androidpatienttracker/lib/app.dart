import 'package:flutter/material.dart';
//import 'package:androidpatienttracker/screens/aboutus_page.dart';
//import 'package:androidpatienttracker/screens/contactus_page.dart';
import 'package:androidpatienttracker/screens/welcome_page.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Android Patient Tracker',
      theme: ThemeData(),
      home: WelcomePage(),
      initialRoute: '/',
      routes: {
      //  '/about': (context) => AboutUsPage(),
      //  '/contact': (context) => ContactUsPage(),
      //  '/welcome': (context) => WelcomePage(),
      },
    );
  }
}