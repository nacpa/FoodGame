import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/TakepictureScreen.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    GetMaterialApp(
      theme: ThemeData.light(),
      home:
      TakePictureScreen(
        camera: firstCamera,
      ),
    ),
  );
}

