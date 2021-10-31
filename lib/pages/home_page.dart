import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:minimal/components/animated_button.dart';
import 'package:minimal/components/header_footer.dart';
import 'package:minimal/components/on_hover.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:minimal/ui/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double imgRateZero = 0;
  double imgRateOne = 0;
  double imgRateTwo = 0;

  @override
  void initState() {
    super.initState();
    getImageUrl("Avro 504K");
    getImageUrl("Victoria Bridge");
    getImageUrl("Holden car");
  }

  Future<String> getImageUrl(String keyword) async {
    var response = await http.get(
        Uri.https("www.data.qld.gov.au", "/api/3/action/datastore_search", {
      "q": "$keyword",
      "resource_id": "8a327cf9-cff9-4b34-a461-6f883bdc3a48",
      "limit": "1"
    }));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var imageUrl = jsonResponse["result"]["records"][0]["1000_pixel_jpg"];
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> imageCards = [
      [
        "Aviation",
        "Airplane.jpg",
        "On Saturday the 6th July 1912, Brisbane had "
            "its first aeroplane flight. The pilot was Mr A. B. (Wizard) "
            "Stone the American daredevil who was barnstorming around Australia. "
            "According to the report in the Brisbane Courier on July 8 of that year,..."
      ],
      [
        "Bridge",
        "Bridge.jpg",
        "For the first 20 years of Brisbane as a free settlement, "
            "ferries transported passengers and goods across the Brisbane River, "
            "To help connect the rapidly growing city with the southern suburbs "
            "the Brisbane City Council decided in 1861 to announce they intended to build a bridge..."
      ],
      [
        "Vehicle",
        "Vehicle.jpg",
        "Holden opened a manufacturing plant at Acacia Ridge, Queensland in 1966, and at the time this "
            "was the most modern of all their plants. A major purpose of the Acacia Ridge facility was to "
            "manufacture Holden’s new small car line, and it was the only Australian plant to build..."
      ]
    ];
    return SafeArea(
      child: Scaffold(
          body: NotificationListener(
        onNotification: (sc) {
          if (sc is ScrollUpdateNotification) {
            setState(() {
              imgRateTwo -= sc.scrollDelta! / 1;
              imgRateOne -= sc.scrollDelta! / 1.1;
              imgRateZero -= sc.scrollDelta! / 4;
            });
          }
          return true;
        },
        child: Stack(
          children: <Widget>[
            ParallaxWidget(top: imgRateZero, asset: "parallax0"),
            ParallaxWidget(top: imgRateOne, asset: "parallax1"),
            ParallaxWidget(top: imgRateTwo, asset: "parallax2"),
            ListView(
              children: <Widget>[
                Container(
                  child: MenuBar(),
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
                Container(
                  color: const Color(0xffffffff),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "A New Way to Learn the History of Queensland",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 32,
                                fontFamily: "Poppins",
                                letterSpacing: 1.8,
                                color: const Color(0xffffaf00)),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                child: const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: const Color(0xffffaf00),
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffffaf00),
                                ),
                                child: const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: const Color(0xffffaf00),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: const Color(0xffffaf00),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            "Designed By",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "Poppins",
                              letterSpacing: 1.3,
                              color: const Color(0xffffaf00),
                            ),
                          ),
                          const Text(
                            "Team Collie",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              letterSpacing: 1.8,
                              color: const Color(0xffffaf00),
                            ),
                          ),
                          SizedBox(height: 150),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 80, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Connection",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            fontFamily: "Poppins",
                                            letterSpacing: 1.8,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "Between",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            fontFamily: "Poppins",
                                            letterSpacing: 1.8,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "the Past and the Present",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            fontFamily: "Poppins",
                                            letterSpacing: 1.8,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(height: 35),
                                      Text(
                                        "We will show you a series of historical \n"
                                        "photos on various topics based on the \n"
                                        "timeline to help you to understand the \n"
                                        "connection between the past and the \n"
                                        "present in Queensland.",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Poppins",
                                          letterSpacing: 1.4,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      AnimatedButton(
                                        onTap: () {
                                          Get.to(collections.elementAt(0));
                                        },
                                        width: 120.0,
                                        height: 40,
                                        color: Colors.black,
                                        fontSize: 16,
                                        buttonText: 'Get started',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(child: OnHover(builder: (isHovered) {
                              return isHovered
                                  ? Column(
                                      children: [
                                        Image.asset("Memorial_c.jpg"),
                                        Text(
                                          "Anzac Square Memorial photo from State library of Queensland",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Image.asset("Memorial_bw.jpg"),
                                        /*
                                        Urban Connections in late-Colonial Brisbane 
                                        - School of Historical and Philosophical Inquiry 
                                        - University of Queensland. (n.d.). Retrieved October 31, 2021, 
                                        from https://hpi.uq.edu.au/project/urban-connections-late-colonial-brisbane
                                         */
                                        Text(
                                          "Anzac Square Memorial photo from State library of Queensland",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                      ],
                                    );
                            }))
                            // FutureBuilder<String>(
                            //     future: getImageUrl(),
                            //     builder: (BuildContext context,
                            //         AsyncSnapshot<String> snapshot) {
                            //       return ;
                            //     })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Opacity(
                                opacity: 0.5,
                                child: ClipPath(
                                    clipper: WaveClipper(),
                                    child: Container(
                                      color: const Color(0xffabdddc),
                                      height: 200,
                                    ))),
                            ClipPath(
                                clipper: WaveClipper(),
                                child: Container(
                                  color: const Color(0xff61a3a2),
                                  height: 180,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        // color: const Color(0xffabdddc),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                                height: 450,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 40),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context, int i) =>
                                      InkWell(
                                    onTap: () {
                                      Get.to(() => collections.elementAt(i));
                                    },
                                    child: Container(
                                        width: 400.0,
                                        child: HoverCard(
                                          title: imageCards[i][0],
                                          image: imageCards[i][1],
                                          description: imageCards[i][2],
                                        )),
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(width: 70);
                                  },
                                )),
                            SizedBox(height: 40),
                            Footer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key? key,
    required this.top,
    required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  HoverCard(
      {required this.image, required this.title, required this.description});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation padding;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 275),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 1.1).animate(CurvedAnimation(
        parent: _controller, curve: Curves.ease, reverseCurve: Curves.easeIn));
    padding = Tween(begin: 0.0, end: -25.0).animate(CurvedAnimation(
        parent: _controller, curve: Curves.ease, reverseCurve: Curves.easeIn));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _controller.forward();
        });
      },
      onExit: (value) {
        setState(() {
          _controller.reverse();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 20.0),
              spreadRadius: -10.0,
              blurRadius: 20.0,
            )
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.hardEdge,
            transform: Matrix4(_animation.value, 0, 0, 0, 0, _animation.value,
                0, 0, 0, 0, 1, 0, padding.value, padding.value, 0, 1),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 3.0,
              color: Colors.white,
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 400,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5.0)),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        widget.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.0,
                      ),
                      Flexible(
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 13,
                              fontFamily: "Poppins",
                              height: 1.4,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
