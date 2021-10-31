import 'dart:math';
import 'package:flutter/material.dart';

import 'header_footer.dart';

class QuizCard extends StatefulWidget {
  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  //declare the isBack bool
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Now we will start making our Card
              //the principe is basic
              //we will create a container that will display the back face or the front face
              // and we will wrap it in a Transform widget
              //then we will make a tween animation for animating our card
              //now let's wrap our tween animation inside a gesture detector
              MenuBar(),
              GestureDetector(
                onTap: _flip,
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: angle),
                    duration: Duration(seconds: 1),
                    builder: (BuildContext context, double val, __) {
                      //here we will change the isBack val so we can change the content of the card
                      if (val >= (pi / 2)) {
                        isBack = false;
                      } else {
                        isBack = true;
                      }
                      return (Transform(
                        //let's make the card flip by it's center
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(val),
                        child: Container(
                            width: 309,
                            height: 474,
                            child: isBack
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: AssetImage("back.png"),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 85),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 150,
                                            ),
                                            Text(
                                              "Question 1",
                                              style: TextStyle(
                                                fontSize: 30.0,
                                              ),
                                            ),
                                            SizedBox(height: 150),
                                            Text(
                                              "Who designed the Sydney Opera House?",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ) //if it's back we will display here
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(pi),
                                    // it will flip horizontally the container
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: AssetImage("face.png"),
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                                height: 300,
                                                width: 200,
                                                image:
                                                    AssetImage('person.jpg')),
                                            Text(
                                              "Jørn Utzon",
                                              style: TextStyle(
                                                fontSize: 30.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ) //else we will display it here,
                            ),
                      ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
