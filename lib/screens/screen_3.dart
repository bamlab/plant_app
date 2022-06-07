import 'package:flutter/material.dart';
import 'package:plant_app/const/resource.dart';
import 'package:plant_app/plant_details.dart';
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
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Hero(
            tag: 'flower',
            child: AnimatedPlant(
              heigth: mediaQuery.size.height / 2,
            ),
          ),
        ),
        Positioned.fill(
          top: mediaQuery.size.height / 2 - 100,
          child: const MovingCard(),
        ),
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
      duration: const Duration(seconds: 3),
      // height: heigth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      curve: Curves.easeIn,
      child: const PlantImage(),
    );
  }
}

class MovingCard extends StatefulWidget {
  const MovingCard({Key? key}) : super(key: key);

  @override
  State<MovingCard> createState() => _MovingCardState();
}

class _MovingCardState extends State<MovingCard>
    with SingleTickerProviderStateMixin {
  double turns = 0.04;
  // Animation<Offset> offsetAnimation=
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.5, 1),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    () async {
      await Future.delayed(const Duration(milliseconds: 16));
      _controller.forward();
      setState(() {
        turns = 0.0;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: AnimatedRotation(
        turns: turns,
        duration: const Duration(seconds: 2),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F5F0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: PlantDetails(),
          ),
        ),
      ),
    );
  }
}
