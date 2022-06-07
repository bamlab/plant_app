import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';
import 'package:plant_app/screens/screen_2.dart';
import 'package:plant_app/plant_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Screen2(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(child: PlantDetails()),
      ),
    );
  }
}
