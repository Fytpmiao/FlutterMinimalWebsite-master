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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        "Qantas.com. 2021. Our history | Qantas AU. [online] Available at:\n "
                        "<https://www.qantas.com/au/en/about-us/our-company/our-history.html>\n "
                        "[Accessed 24 October 2021].\n"),
                    Text("Simpleflying.com. 2021. [online] Available at:\n"
                        "<https://simpleflying.com/qantas-history-australian-flag-carrier/>.\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "State Library Of Queensland. 2021. History of Brisbane's Victoria Bridge. [online] Available at:\n"
                        "<https://www.slq.qld.gov.au/blog/history-brisbanes-victoria-bridge>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "State Library Of Queensland. 2021. Kingsford Smith and the first trans-Pacific flight, 1928. [online] Available at:\n"
                        "<https://www.slq.qld.gov.au/blog/kingsford-smith-and-first-trans-pacific-flight-1928>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "State Library Of Queensland. 2021. James Trackson's tracks : Queensland's first motorist. [online] Available at: \n"
                        "<https://www.slq.qld.gov.au/blog/james-tracksons-tracks-queenslands-first-motorist>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "the Guardian. 2021. A history of Holden in Australia – timeline. [online] Available at:\n"
                        "<https://www.theguardian.com/business/2020/feb/19/a-history-of-holden-in-australia-timeline>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "State Library Of Queensland. 2021. First flight in Brisbane. [online] Available at: \n"
                        "<https://www.slq.qld.gov.au/blog/first-flight-brisbane>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "State Library Of Queensland. 2021. Anzac Square. [online] Available at: \n"
                        "<https://www.slq.qld.gov.au/anzacsquare>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "State Library of Queensland - Picture Queensland | Datasets | data.gov.au - beta. [online] Available at: \n"
                        "<https://data.gov.au/dataset/ds-qld-4295bf38-708a-4832-9665-443b6c08e4e1/details?q=queensland library>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "Free Vector Icons and Stickers - PNG, SVG, EPS, PSD and CSS. [online] Available at: \n"
                        "<https://www.flaticon.com>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "500,000th Holden, 1958 | In 1948 Australian car manufacturer… | Flickr. [online] Available at: \n"
                        "<https://www.flickr.com/photos/national-archives-of-australia/2877053135>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "The Architect - Jørn Utzon - Sydney Opera House. [online] Available at: \n"
                        "<https://www.sydneyoperahouse.com/our-story/the-architect-jorn-utzon.html>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "Urban Connections in late-Colonial Brisbane - School of Historical and Philosophical Inquiry - University of Queensland. [online] Available at: \n"
                        "<https://hpi.uq.edu.au/project/urban-connections-late-colonial-brisbane>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "A History of the Airplane Part 1 | Aircraft | Axis North. [online] Available at: \n"
                        "<http://www.axisnorthproductions.com/the-history/>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "Brisbane, Australia - skyline illustration - New Horizons of genuine commercial picture 0puk0s- photography. [online] Available at: \n"
                        "<https://xsj.699pic.com/tupian/0puk0s.html>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "animations | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/animations>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "google_fonts | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/google_fonts>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text("get | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/get>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "responsive_framework | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/responsive_framework>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text("http | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/http>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text("convert | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/convert>\n "
                        "[Accessed 26 October 2021].\n"),
                    Text(
                        "url_launcher | Flutter Package. [online] Available at: \n"
                        "<https://pub.dev/packages/url_launcher>\n "
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
