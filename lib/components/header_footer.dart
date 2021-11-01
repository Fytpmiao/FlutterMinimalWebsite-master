import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/pages/Q&A.dart';
import 'package:minimal/pages/about_us.dart';
import 'package:minimal/pages/reference.dart';

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Image.asset(
        image,
        width: width,
        height: width / 1.618,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Footer extends StatelessWidget {
  // TODO Add additional footer components (i.e. about, links, logos).
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Align(
        alignment: Alignment.center,
        child: Text("Copyright © 2021"),
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * Menu/Navigation Bar
 *
 * A top menu bar with a text or image logo and
 * navigation links. Navigation links collapse into
 * a hamburger menu on screens smaller than 400px.
 */
class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName)),
                child: Row(
                  children: [
                    Icon(
                      Icons.pets_outlined,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    Text("Collie",
                        style: GoogleFonts.caveat(
                            fontSize: 60,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName)),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(18.0),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: Text("HOME",
                            style: GoogleFonts.caveat(
                                fontSize: 28,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => QA());
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(18.0),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: Text("Q&A",
                            style: GoogleFonts.caveat(
                                fontSize: 28,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => Reference());
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(18.0),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: Text("REFERENCE",
                            style: GoogleFonts.caveat(
                                fontSize: 28,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => AboutUs());
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(18.0),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: Text("ABOUT",
                            style: GoogleFonts.caveat(
                                fontSize: 28,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
