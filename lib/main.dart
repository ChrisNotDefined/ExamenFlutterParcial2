import 'package:flutter/material.dart';
import 'package:examen_p2/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      theme: ThemeData(
        primaryColor: Colors.yellow[900],
        accentColor: Colors.yellow,
      ),
    );
  }
}
