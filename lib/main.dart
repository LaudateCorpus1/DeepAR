import 'package:flutter/material.dart';
import 'package:rwa_deep_ar/rwa_deep_ar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int currentPage = 0;
  int currentPageF = 0;
  int currentPageE = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffect = Effects.fire;
  Filters currentFilter = Filters.none;
  Masks currentMask = Masks.none;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CameraDeepAr(
                cameraDirection: CameraDirection.back,
                onCameraReady: (isReady) {
                  print("Camera status $isReady");
                },
                onImageCaptured: (path) {
                  print("Image Taken $path");
                },
                onVideoRecorded: (path) {
                  print("Video Recorded @ $path");
                },
                //Enter the App key generate from Deep AR
                androidLicenceKey: "<YOUR_ANDROID_KEY>",
                iosLicenceKey: "<YOUR_IOS_KEY>",
                cameraDeepArCallback: (c) async {
                  cameraDeepArController = c;
                  setState(() {});
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                //height: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Effects",
                          style: TextStyle(color: Colors.white),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(4, (p) {
                              bool active = currentPageE == p;
                              return GestureDetector(
                                onTap: () {
                                  currentPageE = p;
                                  cameraDeepArController.changeEffect(p);
                                  setState(() {});
                                },
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: active ? 40 : 30,
                                    height: active ? 50 : 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: active
                                            ? Colors.green
                                            : Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(
                                      "$p",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: active ? 16 : 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    )),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Filters",
                          style: TextStyle(color: Colors.white),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(2, (p) {
                              bool active = currentPageF == p;
                              return GestureDetector(
                                onTap: () {
                                  currentPageF = p;
                                  cameraDeepArController.changeFilter(p);
                                  setState(() {});
                                },
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: active ? 40 : 30,
                                    height: active ? 50 : 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: active
                                            ? Colors.green
                                            : Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(
                                      "$p",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: active ? 16 : 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    )),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Masks",
                          style: TextStyle(color: Colors.white),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(7, (p) {
                              bool active = currentPage == p;
                              return GestureDetector(
                                onTap: () {
                                  currentPage = p;
                                  cameraDeepArController.changeMask(p);
                                  setState(() {});
                                },
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: active ? 40 : 30,
                                    height: active ? 50 : 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: active
                                            ? Colors.green
                                            : Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(
                                      "$p",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: active ? 16 : 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    )),
                              );
                            }),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
