import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/ui/constant.dart';
import 'time_line.dart';

class BridgeBook extends StatefulWidget {
  @override
  _BridgeBookState createState() => _BridgeBookState();
}

class _BridgeBookState extends State<BridgeBook>
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
        color: const Color(0xff000000),
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
                    color: const Color(0xffC0C0C0),
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
        subtitle: 'The History of Victoria Bridge',
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
                                "For the first 20 years of Brisbane as a free settlement, ferries transported "
                                "passengers and goods across the Brisbane River, connecting the settlements "
                                "of North Brisbane and South Brisbane. To help connect the rapidly growing "
                                "city with the southern suburbs the Brisbane City Council decided in 1861 to "
                                "announce they intended to build a bridge connecting Queen Street with Melbourne Street. "
                                "On 16 November 1867 the bridge collapsed, caused by a combination of a high tide placing "
                                "pressure on the weaken wooden piles and a large coach crossing the bridge.",
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Image.asset('brisbane_bridge.jpg',
                              height: 240, width: 180, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('first_victoria.jpg',
                              height: 170, width: 170, fit: BoxFit.cover),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "In 1871, English company Peto, Brassey and Co agreed to build "
                                "a new bridge upgrading the previous wooden design to include "
                                "concrete pylons, lacework parapet and a footpath on each side "
                                "for pedestrians. The bridge was completed in 1874, opened on 15 "
                                "June by Governor George Phipps, 2nd Marquess of Normanby and named "
                                "'Victoria Bridge' after Queen Victoria, the monarch at the time. ",
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "In 1893, the photo shows the remains of the first permanent Victoria Bridge over the flooded Brisbane River. "
                            "This photograph is looking towards South Brisbane. Negative Number 119200, John "
                            "Oxley Library, State Library of Queensland. ",
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Image.asset('first_remains.jpg',
                          height: 170, width: 170, fit: BoxFit.cover),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('second_victoria.jpg',
                          height: 170, width: 170, fit: BoxFit.cover),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Three and half years after the collapse of the first Victoria Bridge "
                            "the council built the second Victoria Bridge. This bridge was designed "
                            "by Alfred Barton Brady and constructed of steel, wrought iron, stone "
                            "and cement. The completed bridge opened on 22 June 1897 by Lord Charles "
                            "Lamington, Governor of Queensland.",
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
                            "In the 1950s, due to the heavy traffic demands, the Brisbane City "
                            "Council decided again to build a new Victoria Bridge, the third "
                            "and current version, opened on 14 April 1969. The bridge is a "
                            "three span, concrete, haunched girder bridge and at the time the "
                            "design was considered modern, sleek and elegant. ",
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Image.asset('third_victoria.jpg',
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
