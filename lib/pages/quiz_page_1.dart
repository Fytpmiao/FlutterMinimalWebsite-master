import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/components/header_footer.dart';
import 'package:minimal/ui/constant.dart';
import 'package:minimal/ui/quiz1.dart';

class QuizPage1 extends StatefulWidget {
  QuizPage1({Key? key}) : super(key: key);

  @override
  _QuizPage1State createState() => _QuizPage1State();
}

class _QuizPage1State extends State<QuizPage1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffabdddc),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MenuBar(),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(50, 60, 60, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: (Row(children: [
                          Icon(
                            Icons.arrow_back_rounded,
                            size: 30,
                          ),
                          Text("Back",
                              style: GoogleFonts.caveat(
                                  fontSize: 28,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w600)),
                        ])),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(collections.elementAt(2));
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Row(children: [
                          Text("Next Collection",
                              style: GoogleFonts.caveat(
                                  fontSize: 28,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w600)),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Body(),
                ),
              ),
            ]),
      ),
    );
  }
}
