import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';

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
        const Flower(),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                    child: PlantImage(),
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
