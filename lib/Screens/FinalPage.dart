import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:newbdh/Screens/Checkout.dart';

class FinalPage extends StatefulWidget {
  FinalPage({Key? key}) : super(key: key);

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
void initState() {
  // TODO: implement initState
  super.initState();
  animationController =AnimationController(duration:  Duration(seconds:3), vsync:this)..forward();
  animation=CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubicEmphasized);
  Timer(Duration(seconds: 3), ()=>
      Get.to(CheckOut(),transition: Transition.cupertino)
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [Container(height: double.maxFinite,width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Lottie.network(
                  "https://assets10.lottiefiles.com/private_files/lf30_dfspihm8.json"),
            ),
            Container(height: 200,width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.grey.shade50),
              child: Lottie.network(
                "https://assets1.lottiefiles.com/packages/lf20_lxededya.json",
              ),
            ),
          ],
        ),
      ), Positioned(
          top: 50,
          left: 10,
          child: Container(
            child: GestureDetector(onTap: (){
              Get.back();
            },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 35,
              ),
            ),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green.shade900),
          ))],)
    );
  }
}
