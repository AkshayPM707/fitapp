//import 'package:fitapp/Httppage.dart';
//import 'package:fitapp/Newpage.dart';
//import 'package:fitapp/Thirdpage.dart';
//import 'package:fitapp/Secondpage.dart';
import 'package:fitapp/Settingspage.dart';
import 'package:fitapp/Firstpage.dart';
import 'package:fitapp/myhomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 51, 199, 22)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home page'),
      routes: {
        '/homepage': (context) => const MyHomePage(title: '',), 
        '/firstpage': (context) => const Firstpage(),
        '/settingspage': (context) => const Settingspage(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}


