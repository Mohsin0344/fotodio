import 'dart:convert';

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:fotodio/Screens/imageeditor.dart';
import 'package:fotodio/Screens/modelclasses/sponsorimagesresponse.dart';

import 'package:multi_image_picker/multi_image_picker.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

///-------------------------------------------------------------------
Future<SponsorImage> fetchSponsorImages() async {
  final String apiUrl = "http://fotod.io/api/sponsorimage";
  final response = await http.post(apiUrl, body: {});

  if (response.statusCode == 200) {
    final String responseString = response.body;

    // print(responseString);

    return SponsorImage.fromRawJson(responseString);
  } else {
    return null;
  }
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  bool selected = false;
  int selectedPicture;
  SponsorImage data1;

  void initState() {
    super.initState();
    fetchData();
  }

  List<Size> data2;

  int _currentIndex = 0;

  List<Asset> images = List<Asset>();
  List files = [];
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
                        child: FutureBuilder(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (data1 != null) {
                              return Center(
                                child: ListView.builder(
                                    itemCount: data1.data.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 4,
                                              right: 4),
                                          child: Center(
                                            child: GestureDetector(
                                              onLongPress: () {
                                                setState(() {
                                                  selected = true;

                                                  selectedPicture = index;
                                                });
                                              },
                                              onTap: () {
                                                selected = false;
                                                selectedPicture = null;
                                              },
                                              child: Container(
                                                width: 174.00,
                                                decoration: selected == true
                                                    ? BoxDecoration(
                                                  color: Colors.blue
                                                      .withOpacity(.4),
                                                )
                                                    : BoxDecoration(
                                                  color:
                                                  Color(0xffffffff),
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color:
                                                    Color(0xffFF245E),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(
                                                          0.00, 3.00),
                                                      color: Color(
                                                          0xff000000)
                                                          .withOpacity(
                                                          0.16),
                                                      blurRadius: 6,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5.00),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        color: Colors.blue
                                                            .withOpacity(.4),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.all(2),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  /// Sponsor's Name
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Expanded(
                                                                            child: Align(
                                                                                alignment:
                                                                                Alignment
                                                                                    .centerLeft,
                                                                                child: Text(
                                                                                    "Sponsor' Name "))),
                                                                        Expanded(
                                                                            child: Align(
                                                                                alignment:
                                                                                Alignment
                                                                                    .centerRight,
                                                                                child: Text(data1
                                                                                    .data[index]
                                                                                    .sponsor))),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  /// Sponsor's Image Size
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Expanded(
                                                                            child: Align(
                                                                                alignment:
                                                                                Alignment
                                                                                    .centerLeft,
                                                                                child: Text(
                                                                                    "Image Size "))),
                                                                        Expanded(
                                                                            child: Align(
                                                                                alignment:
                                                                                Alignment
                                                                                    .centerRight,
                                                                                child: Text(data1.data[index].imgSize)
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  /// Available Images

                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Expanded(
                                                                            child: Align(
                                                                                alignment:
                                                                                Alignment
                                                                                    .centerLeft,
                                                                                child: Text(
                                                                                    "Available Images "))),
                                                                        Expanded(
                                                                            child: Align(
                                                                                alignment:
                                                                                Alignment
                                                                                    .centerRight,
                                                                                child: Text(data1
                                                                                    .data[index].totalsponsored))),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                    }),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 180,
                                child: Center(
                                    child: Text(
                                      "Loading Please Wait..........",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black),
                                    )),
                              );
                            }
                          },
                        )),
                    Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, index) {
                            Asset asset = images[index];

                            return Container(
                              padding: EdgeInsets.all(10),
                              child: AssetThumb(
                                  asset: images[index],
                                  width: 400,
                                  height: 400),
                            );
                          },
                        ))
                  ],
                )),
            bottomNavigationBar: Container(
                height: 56,
                margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: Row(children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Color(0xffFF245E),
                      child: Text(
                        'Pick Image',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        loadAssets();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Color(0xffFF245E),
                      child: Text(
                        'Proceed',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () async {
                        // print(data1.imagepath);
                        //   _submit();

                         Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>ImageSelection(images)));
                      },
                    ),
                  ),
                ]))),
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

  _submit() async {
    for (int i = 0; i < images.length; i++) {
      var path2 =
      await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
      var file = await getImageFileFromAsset(path2);
      var base64Image = base64Encode(file.readAsBytesSync());
      files.add(base64Image);
      print(base64Image);
      var data = {
        "files": files,
      };
      print(data);
      /*  try {
    var response = await http.post(data, ‘Your url’)
    var body = jsonDecode(response.body);
    print(body);
    if (body[‘msg’] == “Success!”) {
    print(‘posted successfully!’);
    } else {
    _showToast(context, body[‘msg’]);
    }
    } catch (e) {
    return e.message;
    }*/
    }
  }

  Future<File> getImageFileFromAsset(String path) async {
    var file = File(path);
    return file;
  }

  Future<void> fetchData() async {
    SponsorImage img = await fetchSponsorImages();

    setState(() {
      data1 = img;

    });

    return data1;
  }
}