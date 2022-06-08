import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantDetails extends StatelessWidget {
  const PlantDetails({
    Key? key,
    required this.plantName,
    required this.data,
  }) : super(key: key);
  final String plantName;
  final String data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
          ),
          color: Color(0xFFF5F6F1),
        ),
        width: constraints.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 47,
            right: 47,
            top: 35,
            bottom: 65,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Header(
                plantName: plantName,
              ),
              const SizedBox(height: 20),
              const _Body(),
              const SizedBox(height: 20),
              _Footer(
                data: data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key, required this.plantName}) : super(key: key);
  final String plantName;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF438264);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          plantName,
          style: TextStyle(
              fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
              fontSize: 36,
              color: const Color(0xFF23483F)),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFCEE5D2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.tag_faces_sharp,
                  color: green,
                  size: 15,
                ),
                const SizedBox(width: 8),
                Text(
                  'She likes your home',
                  style: TextStyle(
                    fontFamily: GoogleFonts.nunitoSans().fontFamily,
                    fontSize: 14,
                    color: green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _BodyElement(
          title: 'Water',
          color: Color(0xFF53adff),
          progress: 75,
          icon: Icons.water_drop_outlined,
          daysLeft: 3,
        ),
        _BodyElement(
          title: 'Fertilizer',
          color: Color(0xFFE38864),
          progress: 50,
          icon: Icons.ac_unit_outlined,
          daysLeft: 15,
        ),
      ],
    );
  }
}

class _BodyElement extends StatelessWidget {
  const _BodyElement(
      {Key? key,
      required this.title,
      required this.color,
      required this.progress,
      required this.icon,
      required this.daysLeft})
      : super(key: key);
  final String title;
  final Color color;
  final int progress;
  final IconData icon;
  final int daysLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 15),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$progress%',
                    style: TextStyle(
                      fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 85,
              height: 85,
              child: CircularProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeWidth: 5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Text(
              '$daysLeft days left',
              style: GoogleFonts.nunitoSans(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.nunitoSans(
        color: const Color(0xFF23483F),
        fontSize: 16,
      ),
    );
  }
}
