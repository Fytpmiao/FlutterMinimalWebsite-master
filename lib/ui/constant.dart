import 'package:flutter/material.dart';
import 'package:minimal/components/vehicle_page.dart';
import 'package:minimal/pages/aviation_page.dart';
import 'package:minimal/pages/bridge_page.dart';

const BoxDecoration containerDecoration =
    BoxDecoration(color: const Color(0xffffffff), boxShadow: [
  BoxShadow(
    color: Colors.grey,
    offset: Offset(0, 3),
    blurRadius: 2.5,
  )
]);

Set<Widget> collections = {AviationPage(), BridgePage(), VehiclePage()};

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;
