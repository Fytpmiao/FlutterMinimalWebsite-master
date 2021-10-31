import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal/components/animated_button.dart';
import 'package:minimal/components/bridge_book.dart';
import 'package:minimal/components/header_footer.dart';
import 'quiz_page_1.dart';

class BridgePage extends StatefulWidget {
  const BridgePage({Key? key}) : super(key: key);

  @override
  _BridgePageState createState() => _BridgePageState();
}

class _BridgePageState extends State<BridgePage> {
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
            BridgeBook(),
            SizedBox(
              height: 25,
            ),
            Container(
              child: AnimatedButton(
                onTap: () {
                  Get.to(() => QuizPage1());
                },
                width: 120.0,
                height: 40,
                color: const Color(0xffC0C0C0),
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
