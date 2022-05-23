
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'DisplayPicture.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;


  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 250,
            width: double.maxFinite,
            child: Lottie.network("https://assets2.lottiefiles.com/packages/lf20_TmewUx.json"),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(boxShadow: [BoxShadow(offset: Offset(2,2),blurRadius: 3,spreadRadius:3 ,color: Colors.grey.shade300)],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
                color: Colors.white,

              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "http://clipart-library.com/images/ziXoyRA7T.png"))),
                    ),
                    Container(

                      height: 230,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(90)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FutureBuilder<void>(
                            future: _initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                // If the Future is complete, display the preview.
                                return CameraPreview(_controller);
                              } else {
                                // Otherwise, display a loading indicator.
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "http://clipart-library.com/new_gallery/27-277548_hd-transparent-images-pluspng-transparent-transparent-background-spoon.png"))),
                    ),
                  ],
                ),
                Text("Click Your Meal",style: TextStyle(fontFamily:'Macondo',fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                    color: Colors.grey.shade900,fontSize: 30),)
              ],),
            ),
          )
        ],
      ),
        Positioned(top: 50,left: 10,
          child: Container(child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 35,),
            height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.green.shade900),))
      ],),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.green.shade900,


        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

           await Get.to(DisplayPictureScreen(
             imagePath: image.path,
           ),transition: Transition.fade);
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
