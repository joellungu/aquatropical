import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'accueil.dart';

class Splash extends StatelessWidget {
  Splash() {
    //
    Timer(const Duration(seconds: 3), () {
      //
      Get.offAll(Accueil());
      //
    });
  }
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Center(
        child: Text("AquaTropical"),
      ),
    );
  }
}
