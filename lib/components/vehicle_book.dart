import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/ui/constant.dart';
import 'time_line.dart';

class VehicleBook extends StatefulWidget {
  @override
  _VehicleBookState createState() => _VehicleBookState();
}

class _VehicleBookState extends State<VehicleBook>
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
                    color: const Color(0xff000000),
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
        subtitle: 'The History of Vehicle',
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
                                "The first motorist in Queensland is James Trackson. "
                                "In 1900 he imported the first internal "
                                "combustion car brought Into Queensland. He has been driving cars ever since and has never had an accident.",
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Image.asset('first_car.jpg',
                              height: 170, width: 170, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('holden_assembly.jpg',
                              height: 180, width: 180, fit: BoxFit.cover),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Holden took its first step into vehicle production when it began making car bodies "
                                "for imported Chevrolet chassis. Holden was the first company to assemble bodies "
                                "for Ford in Australia and by 1924 was the exclusive supplier in Australia of car "
                                "bodies for the US-based General Motors. This is Buick Standard Six of 1925-26. Two "
                                "door sedan build in USA, possibly partly assembled by Holden.",
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
                                "Holden's logo, of a lion holding a stone, was introduced in 1928. "
                                "Holden's Motor Body Builders appointed Rayner Hoff to design "
                                "the emblem, which refers to a fable in which observations of "
                                "lions rolling stones led to the invention of the wheel. With "
                                "the 1948 launch of the 48–215, Holden revised its logo.",
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Image.asset('holden_logo.jpg',
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
                      Image.asset('first_holden.jpg',
                          height: 240, width: 180, fit: BoxFit.cover),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Holden launched its first car 48-215 in 1948, also known as the FX, "
                            "was the first car wholly manufactured in Australia – it was "
                            "economical, sturdy and stylish and was immediately popular with "
                            "the public. By 1958 the Holden had captured more than 40 per cent "
                            "of total car sales in Australia. On November 29, 1948 Prime Minister "
                            "Ben Chifley launches the first Holden car in Port Melbourne and "
                            "declares “she’s a beauty”.",
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
                            "Holden utility is introduced in 1951. This image shows an International "
                            "truck, loaded with wooden tables parked in Elizabeth Street opposite "
                            "the entrance to Barry and Roberts store. Other parked vehicles can "
                            "be seen, including a Holden FX utility.",
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Image.asset('holden_utility.jpg',
                          height: 170, width: 170, fit: BoxFit.cover),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('holden_milestone.jpg',
                          height: 150, width: 150, fit: BoxFit.cover),
                      /* 
                          500,000th Holden, 1958 
                          | In 1948 Australian car manufacturer… | 
                          Flickr. (n.d.). Retrieved October 31, 2021, 
                          from https://www.flickr.com/photos/national-archives-of-australia/2877053135
                      */
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Ten years later, when this photograph was taken, Holden had "
                            "produced 500,000 vehicles and was well established in the "
                            "domestic car market. The car seen crashing through here is "
                            "the 1958 FC Holden.",
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
