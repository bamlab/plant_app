import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({Key? key}) : super(key: key);

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F5F0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Strelitzia Nicolai",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 36, color: const Color(0xFF23483F)),
                ),
              ),
            ),
            const HeaderLabel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Indicator(
                  title: 'Water',
                  color: const Color.fromRGBO(83, 173, 255, 1),
                  daysLeft: '3 days left',
                  icon: Image.asset('assets/images/drop.png'),
                  percentage: 75 / 100,
                ),
                Indicator(
                  title: 'Ferttillizer',
                  color: const Color(0xFFE38864),
                  daysLeft: '15 days left',
                  icon: Image.asset('assets/images/points.png'),
                  percentage: 50 / 100,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
              child: Text(
                "Strelitzia, commonly known as the bird of paradise, is the undisputed queen of the houseplant world. One look at its blooms and you'll find out where it got its name; the flowers look incredibly like the head of an exotic bird.",
                style: GoogleFonts.nunitoSans(
                    fontSize: 16, height: 1.5, color: const Color(0xFF23483F)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderLabel extends StatelessWidget {
  const HeaderLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 35,
        margin: const EdgeInsets.only(left: 43, bottom: 24),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xFFCEE5D2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.face, size: 16, color: Color(0xFF438264)),
          const SizedBox(width: 8),
          Text(
            'She likes your home !',
            style: GoogleFonts.nunitoSans(color: const Color(0xFF438264)),
          )
        ]),
      ),
    );
  }
}

class IndicatorCircle extends StatefulWidget {
  const IndicatorCircle({
    Key? key,
    required this.percentage,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final double percentage;
  final Image icon;
  final Color color;

  @override
  State<IndicatorCircle> createState() => _IndicatorCircleState();
}

class _IndicatorCircleState extends State<IndicatorCircle> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50,
      animation: true,
      animationDuration: 1200,
      lineWidth: 6,
      percent: widget.percentage,
      center: Align(
          alignment: Alignment.center,
          child: Container(
            width: 66.67,
            height: 66.67,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.percentage}%',
                  style: GoogleFonts.dmSerifDisplay(color: Colors.white),
                ),
                const SizedBox(
                  height: 2,
                ),
                widget.icon,
              ],
            )),
          )),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.transparent,
      progressColor: widget.color,
    );
  }
}

class Indicator extends StatefulWidget {
  const Indicator({
    Key? key,
    required this.title,
    required this.icon,
    required this.percentage,
    required this.color,
    required this.daysLeft,
  }) : super(key: key);

  final String title;
  final Image icon;
  final double percentage;

  final Color color;
  final String daysLeft;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(widget.title,
              style: GoogleFonts.dmSerifDisplay(
                textStyle:
                    const TextStyle(fontSize: 16, color: Color(0xFF22483F)),
              )),
        ),
        IndicatorCircle(
            icon: widget.icon,
            percentage: widget.percentage,
            color: widget.color),
        IndicatorLabel(color: widget.color, daysLeft: widget.daysLeft)
      ],
    );
  }
}

class IndicatorLabel extends StatelessWidget {
  const IndicatorLabel({
    Key? key,
    required this.daysLeft,
    required this.color,
  }) : super(key: key);

  final String daysLeft;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Center(
          child: Text(
            daysLeft,
            style: GoogleFonts.nunitoSans(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
