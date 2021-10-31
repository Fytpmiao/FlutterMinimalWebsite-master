import 'package:minimal/pages/quiz_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal/components/animated_button.dart';
import 'package:minimal/components/header_footer.dart';

import 'vehicle_book.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
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
            VehicleBook(),
            SizedBox(
              height: 25,
            ),
            Container(
              child: AnimatedButton(
                onTap: () {
                  Get.to(() => QuizPage2());
                },
                width: 120.0,
                height: 40,
                color: const Color(0xff000000),
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
