import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const/resource.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22483F),
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlobTop(),
            BlobLeft(),
            BlobRight(),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(-0.8, -0.9),
              child: TasksWidget(),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(0.45, -0.9),
              child: IconlessBubble(
                assetName: R.ASSETS_IMAGES_PLANT_1_PNG,
                size: 82,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(1.05, -0.7),
              child: IconlessBubble(
                assetName: R.ASSETS_IMAGES_PLANT_5_PNG,
                size: 73,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(0.7, -0.4),
              child: IconlessBubble(
                assetName: R.ASSETS_IMAGES_PLANT_4_PNG,
                size: 111,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(-0.8, -0.1),
              child: IconedBubble(
                assetName: R.PLANT,
                size: 170,
                icon: Icon(Icons.home_outlined),
                color: Color(0xFF53ADFF),
                isExpanded: false,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(0.8, 0.1),
              child: IconedBubble(
                assetName: R.ASSETS_IMAGES_PLANT_6_PNG,
                size: 170,
                icon: Icon(Icons.access_alarm_outlined),
                color: Color(0xFFFFB900),
                isExpanded: false,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(-0.3, 0.3),
              child: IconlessBubble(
                assetName: R.ASSETS_IMAGES_PLANT_8_PNG,
                size: 73,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(0.35, 0.65),
              child: IconedBubble(
                assetName: R.ASSETS_IMAGES_PLANT_7_PNG,
                size: 170,
                icon: Icon(Icons.add_circle_outline),
                color: Color(0xFFD98A65),
                isExpanded: false,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(-0.8, 0.6),
              child: IconlessBubble(
                assetName: R.ASSETS_IMAGES_PLANT_1_PNG,
                size: 73,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(-0.6, 1.05),
              child: IconedBubble(
                assetName: R.ASSETS_IMAGES_PLANT_7_PNG,
                size: 170,
                icon: Icon(Icons.add_circle_outline),
                color: Color(0xFF4CA874),
                isExpanded: false,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(1.3, 0.85),
              child: IconlessBubble(
                assetName: R.ASSETS_IMAGES_PLANT_5_PNG,
                size: 125,
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment: Alignment(0, 1),
              child: BottomSheet(),
            ),
          ],
        ),
      ),
    );
  }
}

class BlobTop extends StatelessWidget {
  const BlobTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startAlignment = Alignment(8, -1.5);
    final startTurns = pi;

    final endAlignment = Alignment(12, -1.7);
    final endTurns = pi / 8;
    return AnimatedAlign(
      duration: animationDuration,
      alignment: startAlignment,
      child: AnimatedRotation(
        duration: animationDuration,
        turns: startTurns,
        child: Image.asset(
          R.BLOB_TOP,
        ),
      ),
    );
  }
}

class BlobLeft extends StatelessWidget {
  const BlobLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startAlignment = Alignment(0, -0.5);
    final startTurns = -0.25;

    final endAlignment = Alignment(12, -1.7);
    final endTurns = 0.0;
    return AnimatedSlide(
      duration: animationDuration,
      offset: Offset(-0.7, -0),
      child: AnimatedRotation(
        duration: animationDuration,
        turns: startTurns,
        child: Image.asset(
          R.BLOB_LEFT,
        ),
      ),
    );
  }
}

class BlobRight extends StatelessWidget {
  const BlobRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startAlignment = Alignment(23, 1);
    final startTurns = -0.0;

    final endAlignment = Alignment(12, -1.7);
    final endTurns = 0.0;
    return AnimatedAlign(
      duration: animationDuration,
      alignment: startAlignment,
      child: AnimatedRotation(
        duration: animationDuration,
        turns: startTurns,
        child: Image.asset(
          R.BLOB_RIGHT,
        ),
      ),
    );
  }
}

class IconedBubble extends StatelessWidget {
  const IconedBubble({
    Key? key,
    required this.color,
    required this.icon,
    required this.assetName,
    required this.size,
    required this.isExpanded,
  }) : super(key: key);

  final Color color;
  final Widget icon;
  final String assetName;
  final double size;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final double iconSize = isExpanded ? 94 : 48;

    return SizedBox.square(
      dimension: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox.square(
            dimension: size,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: FittedBox(
                    child: Image.asset(
                      assetName,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: animationDuration,
            top: size / 2 + sin(pi / 4) * size / 2 - iconSize / 2,
            left: size / 2 + cos(-pi / 4) * size / 2 - iconSize / 2,
            child: AnimatedContainer(
              duration: animationDuration,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              width: iconSize,
              height: iconSize,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: icon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconlessBubble extends StatelessWidget {
  const IconlessBubble({
    Key? key,
    required this.assetName,
    required this.size,
  }) : super(key: key);

  final String assetName;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ClipOval(
        child: FittedBox(
          child: Image.asset(
            assetName,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

const animationDuration = Duration(milliseconds: 300);

class TasksWidget extends StatelessWidget {
  TasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final separator = Container(
      height: 1,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(2),
      ),
    );

    return Container(
      width: 176,
      height: 230,
      decoration: BoxDecoration(
        color: Color(0xFFCEE5D2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home_outlined),
                SizedBox(width: 10),
                Text('Charlotte’s room'),
              ],
            ),
            SizedBox(height: 24),
            separator,
            SizedBox(height: 0),
            Expanded(
              child: FittedBox(
                child: Text(
                  '2',
                  style: GoogleFonts.dmSerifDisplay(),
                ),
              ),
            ),
            SizedBox(height: 0),
            separator,
            SizedBox(height: 24),
            Text(
              'tasks for today',
              style: GoogleFonts.nunitoSans(fontSize: 16),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = 52.0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          height: 72,
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5A964E).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  width: radius,
                  height: radius,
                  child: Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: Color(0xFF5A964E),
                  ),
                ),
                SizedBox.square(
                  dimension: radius,
                  child: Icon(
                    Icons.person_outline,
                    size: 30,
                    color: Color(0xFF71716B),
                  ),
                ),
                SizedBox.square(
                  dimension: radius,
                  child: Icon(
                    Icons.search_outlined,
                    size: 30,
                    color: Color(0xFF71716B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
