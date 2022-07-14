import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexander Dmitriev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue,

        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ),      
      home: const MyHomePage(title: 'Alexander Dmitriev Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.shortestSide * 0.15,
              backgroundColor: Colors.white,
            ),
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
