import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:minimal/components/header_footer.dart';

class QA extends StatelessWidget {
  const QA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MenuBar(),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Q&A",
                        style: const TextStyle(
                          fontSize: 42,
                          fontFamily: "Poppins",
                          letterSpacing: 1.8,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text("Q1: How did the team develop the project?",
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w800)),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              letterSpacing: 1.8,
                            ),
                            children: [
                          TextSpan(
                              text:
                                  "Our team used fluent for software development. You can "
                                  "find the source code of our project in "),
                          TextSpan(
                            text: "Fytpmiao/TeamCollie (github.com)",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              letterSpacing: 1.8,
                              color: const Color(0xff61a3a2),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch(
                                    'https://github.com/Fytpmiao/TeamCollie');
                              },
                          ),
                          TextSpan(
                              text:
                                  ". We added references and comments to the source code."
                                  " Flutter is Google's UI toolkit for building beautiful, natively "
                                  "compiled applications for mobile, web, desktop, and embedded "
                                  "devices from a single codebase. For more information, see"),
                          TextSpan(
                            text:
                                " Beautiful native apps in record time | Flutter",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              letterSpacing: 1.8,
                              color: const Color(0xff61a3a2),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch('https://flutter.dev/');
                              },
                          )
                        ])),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                        "Q2: In this project, what functions are planned but not implemented by the team?",
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w800)),
                    Text(
                      """There are two parts that we were unable to complete in the final product. The first part is that we did not add the "old photo color restoration" technology to the content page of the story collection because we had a decision here.Another problem is that because we use the book's concept to display content, the effect of "flipping the book" is something we want to show in the product.""",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        letterSpacing: 1.8,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text("Q3: Why didn't the team implement these functions?",
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w800)),
                    Text(
                      "In fact, we have this kind of recovery technology used on the "
                      "content page, which helps narrow the distance between users"
                      " and history. But the actual situation is that we found in "
                      "the test that users have reduced the feeling of years after "
                      "using this function. This situation is not what we want to "
                      "encounter, so we deleted this function on the content page."
                      "There are some problems with the page turning function, we "
                      "found that this effect will cause our text and image content"
                      " to display abnormally. So, in order not to affect the user "
                      "experience, we finally deleted this feature. But if this technology"
                      " can be completed in the future, it will undoubtedly increase the user experience.",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        letterSpacing: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
