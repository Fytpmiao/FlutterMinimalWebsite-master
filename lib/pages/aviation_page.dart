import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal/components/animated_button.dart';
import 'package:minimal/components/header_footer.dart';
import 'package:minimal/components/aviation_book.dart';
import 'package:minimal/pages/quiz_page.dart';

class AviationPage extends StatefulWidget {
  const AviationPage({Key? key}) : super(key: key);

  @override
  _AviationPageState createState() => _AviationPageState();
}

class _AviationPageState extends State<AviationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            MenuBar(),
            SizedBox(height: 20),
            AviationBook(),
            SizedBox(
              height: 25,
            ),
            Container(
              child: AnimatedButton(
                onTap: () {
                  Get.to(() => QuizPage());
                },
                width: 120.0,
                height: 40,
                color: const Color(0xffff62b2),
                fontSize: 16,
                buttonText: 'Take Quiz',
              ),
            ),
            // )
          ],
        ),
      )),
    );
  }
}
