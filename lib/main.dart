import 'package:flutter/material.dart';
import 'package:recipies_app/pages/home_page.dart';
import 'package:recipies_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
        ),
        colorScheme: const ColorScheme.dark().copyWith(primary: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(14, 0, 61, 1),
        ),
      ),
      initialRoute: '/login',
      routes:{
        '/login':(context) => const LoginPage(),
        '/home':(context) => const HomePage(),
      }
    );
  }
}