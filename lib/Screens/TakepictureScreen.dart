
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    // create a CameraController.
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
      body: Stack(children: [Column(
        children: [
          Container(
            height: 250,
            width: double.maxFinite,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
                color: Colors.grey.shade200,
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
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(80)),
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
                                  "https://img.favpng.com/3/5/8/spoon-hot-thoughts-do-you-nefarious-they-want-my-soul-png-favpng-FqAYTzJ4FHZEtQJABD5aSFAWb.jpg"))),
                    ),
                  ],
                ),
                Text("Click Your Meal",style: TextStyle(color: Colors.grey.shade900,fontSize: 30,fontStyle: FontStyle.italic),)
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


        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
