import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';
import 'package:plant_app/screens/screen_2.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          R.ASSETS_IMAGES_BACKGROUND_PNG,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Hero(
                tag: 'flower',
                child: AnimatedPlant(
                  heigth: mediaQuery.size.height / 2,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class AnimatedPlant extends StatefulWidget {
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
  State<AnimatedPlant> createState() => _AnimatedPlantState();
}

class _AnimatedPlantState extends State<AnimatedPlant> {
  double? heigth = 200;
  BorderRadiusGeometry? borderRadius = BorderRadius.circular(100);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    () async {
      await Future.delayed(const Duration(milliseconds: 16));
      setState(() {
        borderRadius = BorderRadius.circular(0);
        heigth = widget.heigth;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      // height: heigth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      curve: Curves.bounceInOut,
      child: const PlantImage(),
    );
  }
}
