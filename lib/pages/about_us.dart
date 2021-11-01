import 'package:flutter/material.dart';
import 'package:minimal/components/header_footer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MenuBar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Our Team",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontFamily: "Poppins",
                        letterSpacing: 1.8,
                        fontWeight: FontWeight.bold,
                      ),
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
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 150,
                          child: const Divider(
                            height: 1,
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Keming Zhu\n"
                      "Mulin Jia\n"
                      "Weisen Li\n"
                      "Yucheng Chen\n"
                      "Yuliang Liu\n",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                    ),
                  ],
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text("Our Team",
                //         style: const TextStyle(
                //             fontSize: 42,
                //             fontFamily: "Poppins",
                //             letterSpacing: 1.8,
                //             fontWeight: FontWeight.bold)),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //         "Keming Zhu\n"
                //         "Mulin Jia\n"
                //         "Weisen Li\n"
                //         "Yucheng Chen\n"
                //         "Yuliang Liu\n",
                //         style: const TextStyle(
                //           fontSize: 22,
                //           fontFamily: "Poppins",
                //           letterSpacing: 1.8,
                //         )),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
