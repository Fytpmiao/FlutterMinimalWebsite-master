import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal/components/header_footer.dart';

class Reference extends StatelessWidget {
  const Reference({Key? key}) : super(key: key);

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
                    Text("Reference",
                        style: const TextStyle(
                          fontSize: 42,
                          fontFamily: "Poppins",
                          letterSpacing: 1.8,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "1. Qantas.com. 2021. Our history | Qantas AU. [online] Available at:\n "
                        "<https://www.qantas.com/au/en/about-us/our-company/our-history.html>\n "
                        "[Accessed 24 October 2021].\n"),
                    Text("2. Simpleflying.com. 2021. [online] Available at:\n"
                        "<https://simpleflying.com/qantas-history-australian-flag-carrier/>.\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "3. State Library Of Queensland. 2021. History of Brisbane's Victoria Bridge. [online] Available at:\n"
                        "<https://www.slq.qld.gov.au/blog/history-brisbanes-victoria-bridge>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "4. State Library Of Queensland. 2021. Kingsford Smith and the first trans-Pacific flight, 1928. [online] Available at:\n"
                        "<https://www.slq.qld.gov.au/blog/kingsford-smith-and-first-trans-pacific-flight-1928>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "5. State Library Of Queensland. 2021. James Trackson's tracks : Queensland's first motorist. [online] Available at: \n"
                        "<https://www.slq.qld.gov.au/blog/james-tracksons-tracks-queenslands-first-motorist>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "6. the Guardian. 2021. A history of Holden in Australia – timeline. [online] Available at:\n"
                        "<https://www.theguardian.com/business/2020/feb/19/a-history-of-holden-in-australia-timeline>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "7. State Library Of Queensland. 2021. First flight in Brisbane. [online] Available at: \n"
                        "<https://www.slq.qld.gov.au/blog/first-flight-brisbane>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "8. State Library Of Queensland. 2021. Anzac Square. [online] Available at: \n"
                        "<https://www.slq.qld.gov.au/anzacsquare>\n "
                        "[Accessed 26 October 2021].\n"),
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
