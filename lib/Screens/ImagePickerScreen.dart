import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  int _currentIndex = 0;
  List cardList = <Widget>[];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffFF245E),
            title: Center(
              child: Text(
                'Pick Image',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height * 0.999,
            width: double.infinity,
            decoration: BoxDecoration(
                //color: Color(0xffFF245E),
                border: Border(
                    top: BorderSide(
                        color: Colors.black,
                        width: 1.0
                    ),
                    bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0
                    )
                )
            ),
            // child: CarouselSlider(
            //   options: CarouselOptions(
            //     height: double.infinity,
            //     autoPlay: false,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     pauseAutoPlayOnTouch: true,
            //     aspectRatio: 1/4,
            //     onPageChanged: (index, reason) {
            //       setState(() {
            //         _currentIndex = index;
            //       });
            //     },
            //   ),
            //   items: List.generate(images.length, (index) {
            //     Asset asset = images[index];
            //     return Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 0.0),
            //       child: AssetThumb(
            //         asset: asset,
            //         width: 200,
            //         height: 400,
            //       ),
            //     );
            //   }),
            // ),
            child: ListView(
              children: [
                Container(
                  height: 180,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 1,
                              right: 1
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              width: 90,
                              color: Colors.blue.withOpacity(0.2),
                              alignment: Alignment.center,
                              child: Text('IMAGES FROM API'),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                Container(
                  height: 500,
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, index){
                        Asset asset = images[index];
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(asset)
                            )
                          ),
                        );
                      },
                    )
                )
              ],
            )
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xffFF245E)),
                child: RaisedButton(
                  color: Color(0xffFF245E),
                  child: Text(
                    'Pick Image',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  onPressed: () {
                    loadAssets();
                  },
                ),
              )),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
}
