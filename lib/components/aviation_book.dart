import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/ui/constant.dart';
import 'time_line.dart';

class AviationBook extends StatefulWidget {
  @override
  _AviationBookState createState() => _AviationBookState();
}

class _AviationBookState extends State<AviationBook>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(250, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          if (value) {
            _controller.forward();
          }
          // else {
          //   _controller.reverse();
          // }
        },
        child: Transform.translate(
          offset: _animation.value,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              InsideScreen(),
              AnimatedScreen(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class CoverPage extends StatelessWidget {
  final String title;
  final String subtitle;

  CoverPage({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration.copyWith(
        color: const Color(0xffff62b2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 540,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.pets_outlined,
                  color: Colors.white,
                  size: 80.0,
                ),
                Text(
                  title,
                  style: GoogleFonts.caveat(
                      fontSize: 60,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.caveat(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              color: const Color(0xffffffff),
              height: 90,
              width: 500,
              child: Center(
                child: Text(
                  'View me',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffff62b2),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Cover Page
class AnimatedScreen extends StatefulWidget {
  final AnimationController controller;

  AnimatedScreen({required this.controller});

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  late Animation _animation;
  Widget visibleScreen = Container();

  Widget getScreen() {
    if (_animation.value < 0.5) {
      visibleScreen = CoverPage(
        title: 'Team Collie',
        subtitle: 'The History of Aviation',
      );
    } else {
      visibleScreen = ImageScreen();
    }
    return visibleScreen;
  }

  @override
  void initState() {
    _animation = Tween(begin: 0.0, end: 1.0).animate(widget.controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(pi * _animation.value),
      child: getScreen(),
    );
  }
}

//Second Page
class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Container(
        height: 630,
        width: 500,
        decoration: containerDecoration,
        child: kIsWeb
            ? Container(
                color: Colors.white,
                child: Timeline(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "On July 6, 1912, Brisbane had its first aeroplane flight. "
                                "According to the report in the Brisbane Courier, the event was one “of "
                                "scientific and historic interest, a chapter in Queensland’s share of "
                                "the romance of the conquest of the air”. To witness this historic event "
                                "8,000 spectators gathered at the main oval at the Brisbane Exhibition grounds.",
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Image.asset('Airplane.jpg',
                              height: 170, width: 170, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('FirstQantasPlane.jpg',
                              height: 180, width: 180, fit: BoxFit.cover),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "On November 16, 1920, Qantas (Queensland and Northern Territory Aerial Services) "
                                "was established in Queensland in 1920. "
                                "The first Qantas aircraft was an Avro 504K biplane, built from timber and cotton fabric and "
                                "originally developed as a military aircraft during World War I. After initial "
                                "operations as a mail service, Qantas carried its first paying passenger in 1922.",
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "On June 9, 1928, a massive crowd gathered at Eagle Farm Aerodrome to welcome "
                                "and congratulate Brisbane born aviator Charles Kingsford Smith along with "
                                "fellow Australian pilot Charles Ulm, after completing the first trans-Pacific flight.",
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Image.asset('first_trans_Pacific_flight.jpg',
                              height: 170, width: 170, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ],
                  indicators: <Widget>[
                    Icon(Icons.event),
                    Icon(Icons.event),
                    Icon(Icons.event),
                  ],
                ))
            : Container(),
      ),
    );
  }
}

//Third Page
class InsideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 630,
        width: 500,
        decoration: containerDecoration,
        child: Container(
            color: Colors.white,
            child: Timeline(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('FlyOverBrisbane.jpg',
                          height: 170, width: 170, fit: BoxFit.cover),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "In early 1935, Qantas' first international flight left "
                            "Australia from Darwin in 1935, carrying passengers "
                            "from Brisbane to Singapore via the NT capital."
                            "Empire flying boat Cooee, operated by QANTAS, circling over Brisbane, 1938",
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "This photo was taken in 1940. Captain Doug Teannent, a woman in white dress "
                            "and hat and two other airman at the gangplank of a Qantas Empire Airways "
                            "plane. The men are in uniform. The windows are visible above the wing.",
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Image.asset('QantasCrew.jpg',
                          height: 170, width: 170, fit: BoxFit.cover),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('QantasSoldiers.jpg',
                          height: 170, width: 170, fit: BoxFit.cover),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Between 1939 and 1947, Qantas struggled to continue its operations, as "
                            "enemy action and accidents destroyed half of its fleet, after being taken "
                            "over by the Australian government for war service. In this photo, World War II soldiers"
                            " stood in front of Qantas plane",
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              indicators: <Widget>[
                Icon(Icons.event),
                Icon(Icons.event),
                Icon(Icons.event),
              ],
            )));
  }
}

class RightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(20, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 2 - 10, 0);
    path.lineTo(size.width / 2, 10.0);
    path.lineTo(size.width / 2 + 10, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
