import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:newbdh/Screens/FinalPage.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 40,),
              Container(
                height: 250,
                width: double.maxFinite,
                child: Lottie.network("https://assets2.lottiefiles.com/packages/lf20_lc46h4dr.json"),
              ),
              Expanded(
                  child: Container(width: double.maxFinite,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        height: 250,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(90)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.file(File(imagePath)),
                          ),
                        ),
                      ),
                      Text("Will You Eat this",style: TextStyle(fontFamily: "Macondo",color: Colors.grey.shade900,fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)
                    ],),
                      decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
                color: Colors.grey.shade200,
              )))
            ],
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
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        // Provide an onPressed callback.
        onPressed: () async {
          Get.to(FinalPage(),transition: Transition.fade);
        },
        child: const Icon(
          Icons.check,
          size: 50,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

// Image.file(File(imagePath))
