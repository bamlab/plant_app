import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const PlantDetailSPage(),
    );
  }
}

class PlantDetailSPage extends StatefulWidget {
  const PlantDetailSPage({Key? key}) : super(key: key);

  @override
  State<PlantDetailSPage> createState() => _PlantDetailSPageState();
}

class _PlantDetailSPageState extends State<PlantDetailSPage> {
  late double alignment = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          // bottom: MediaQuery.of(context).size.height * 0.5,
          child: FittedBox(
            child: Image.asset(
              R.ASSETS_IMAGES_PLANT_PNG,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, alignment),
          child: const PlantDetails(
            plantName: 'Strelitzia Nicolai',
            data:
                '''Strelitzia, commonly known as the bird of paradise, is the undisputed queen of the houseplant world. One look at its blooms and you'll find out where it got its name; the flowers look incredibly like the head of an exotic bird.''',
          ),
        ),
      ],
    );
  }
}
