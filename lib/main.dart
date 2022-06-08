import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';
import 'package:plant_app/home.dart';
import 'package:plant_app/plant_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        FadeTransition(
                            opacity: animation, child: HomePageLouis()))));
          },
          child: const HomePage(),
        );
      }),
    );
  }
}

class HomePageLouis extends StatelessWidget {
  const HomePageLouis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      body: PlantDetailSPage(),
    );
  }
}

class PlantDetailSPage extends StatefulWidget {
  const PlantDetailSPage({Key? key}) : super(key: key);

  @override
  State<PlantDetailSPage> createState() => _PlantDetailSPageState();
}

class _PlantDetailSPageState extends State<PlantDetailSPage> {
  late double turns = 0.02;
  late Alignment alignment = const Alignment(2, 3);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        turns = 0;
        alignment = const Alignment(0, 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Hero(
              tag: 'plant-2',
              child: Image.asset(
                R.ASSETS_IMAGES_PLANT_PNG,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        AnimatedAlign(
          duration: kAnimationDuration,
          alignment: alignment,
          child: AnimatedRotation(
            alignment: Alignment.bottomCenter,
            duration: kAnimationDuration,
            turns: turns,
            child: const PlantDetails(
              plantName: 'Strelitzia Nicolai',
              data:
                  '''Strelitzia, commonly known as the bird of paradise, is the undisputed queen of the houseplant world. One look at its blooms and you'll find out where it got its name; the flowers look incredibly like the head of an exotic bird.''',
            ),
          ),
        ),
      ],
    );
  }
}

const kAnimationDuration = Duration(milliseconds: 500);
