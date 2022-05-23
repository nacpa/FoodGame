import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newbdh/Screens/DisplayPicture.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              child: Lottie.network(
                  "https://assets2.lottiefiles.com/packages/lf20_lc46h4dr.json"),
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
            left: 30,
            child: Container(
              height: 250,
              width: 200,
              color: Colors.white,
              child: Lottie.network(
                  "https://assets10.lottiefiles.com/packages/lf20_frjb7553.json"),
            ),
          ),
          Positioned(
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
              )),
          Positioned(
              bottom: 40,
              left: 60,
              height: 60,
              width: 250,
              child: GestureDetector(onTap: (){
                Get.back();
              },
                child: Container(decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(2, 5),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Colors.grey.shade500)
                      ]),child: Center(child: Text("Share Your Meal Again",style: TextStyle(color: Colors.white,fontSize: 23,fontFamily: "Macondo",fontWeight: FontWeight.w600),)),
                ),
              ))
        ],
      ),
    );
  }
}
