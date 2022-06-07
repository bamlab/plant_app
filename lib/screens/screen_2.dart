import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';
import 'package:plant_app/screens/screen_3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(children: [
        Image.asset(
          R.ASSETS_IMAGES_BACKGROUND_PNG,
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 4),
                pageBuilder: (_, __, ___) => const Screen3()),
          ),
          child: const Flower(),
        ),
      ]),
    );
  }
}

class Flower extends StatelessWidget {
  const Flower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 240.0,
        width: 240.0,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(
                    color: const Color(0xFF53ADFF),
                    width: 2.0,
                  ),
                ),
                padding: const EdgeInsets.all(5.0),
                child: const Hero(
                  tag: 'flower',
                  child: AnimatedPlant(
                    radius: 100,
                    heigth: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: const Color(0xFF53ADFF),
                ),
                height: 80,
                width: 80,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.water_drop_outlined,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantImage extends StatelessWidget {
  const PlantImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      R.ASSETS_IMAGES_PLANT_9_PNG,
      fit: BoxFit.cover,
    );
  }
}

class AnimatedPlant extends StatelessWidget {
  const AnimatedPlant({
    Key? key,
    this.heigth,
    this.width,
    this.radius = 0,
  }) : super(key: key);
  final double? heigth;
  final double? width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const PlantImage(),
    );
  }
}
