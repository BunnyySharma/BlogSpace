import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspaceass/models/favblog.dart';
import 'package:subspaceass/screens/Home.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => Favblogmodel(),
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (context) => home(),
      },
    );
  }
}