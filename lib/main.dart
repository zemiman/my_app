import 'package:flutter/material.dart';
import 'package:my_app/pages/choose_location.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/loading.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ),
);
