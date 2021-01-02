import 'package:flutter/material.dart';
import 'package:fotodio/Models/SizeModel.dart';
import 'package:fotodio/Screens/PlaceOrderScreen.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http/http.dart' as http;

class ImageSelection extends StatefulWidget {
  List<Asset> images = List<Asset>();
  ImageSelection(this.images);
  @override
  _ImageSelectionState createState() => _ImageSelectionState(this.images);
}
Future<SizeModel> showSizes() async{
  final String apiUrl = "http://fotod.io/api/pricesize";
  final response = await http.post(apiUrl, body: {});

  if(response.statusCode == 200){
    final String responseString = response.body;
    print(responseString);
    return SizeModel.fromRawJson(responseString);
  }else {
    return null;
  }
}
class _ImageSelectionState extends State<ImageSelection> {
  ///--------------------------------------------
  List<DropdownMenuItem> list;
  List data = List();
  SizeModel _sizes;
  List<Asset> images = List<Asset>();
  _ImageSelectionState(this.images);
  var itemCount;
  var _dropDownValue;

  void initState(){

    itemCount = new List(images.length);
    _dropDownValue = new List(images.length);
    for(int i = 0; i<images.length; i++){
      itemCount[i] = 1;
      _dropDownValue[i] = 1;
    }
    // List<Size> _dropdownItems = [
    // Size(id:_sizes.data.size[0].id,imgSize: _sizes.data.size[0].imgSize),
    // ];

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xffFF245E),
              title: Center(
                child: Text(
                    "Images Selection"
                ),
              ),
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              )
          ),
          body: FutureBuilder(
            future: fetchSize(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return  ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, index){
                    Asset asset = images[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xffFF245E),
                                  width: 0.5
                              )
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 1,
                          //     blurRadius: 8
                          //   )
                          // ]
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                // child: Container(
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //       image: AssetImage('images/image.png'),
                                //       fit: BoxFit.cover
                                //     )
                                //   ),
                                // ),
                                child: AssetThumb(
                                  asset: asset,
                                  height: 100,
                                  width: 100,
                                  quality: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsets.all(6),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Color(0xffFF245E),
                                                          width: 0.5,
                                                        )
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: (){
                                                          setState(() {
                                                            if(itemCount[index]>1){
                                                              itemCount[index]-=1;
                                                            }
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Color(0xffFF245E),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffFF245E),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                        '${itemCount[index]}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      )
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsets.all(6),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Color(0xffFF245E),
                                                          width: 0.5,
                                                        )
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: (){
                                                          setState(() {
                                                            itemCount[index]+=1;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Color(0xffFF245E),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12.0),
                                              color: Color(0xffFF245E),
                                            ),
                                            child: RaisedButton(
                                                onPressed: (){},
                                                color: Color(0xffFF245E),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12.0)
                                                ),
                                                child: DropdownButton(
                                                  value: _dropDownValue[index],
                                                  dropdownColor: Color(0xffFF245E),
                                                  iconEnabledColor: Colors.white,
                                                  iconDisabledColor: Colors.white,
                                                  items: [
                                                    DropdownMenuItem(
                                                      child: _sizes.data[0].imgSize == null?
                                                      Container(
                                                        child: CircularProgressIndicator(),
                                                      ):
                                                      Text('${_sizes.data[0].imgSize} Matte',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                      value: 1,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: _sizes.data[1].imgSize == null?
                                                      Container(
                                                        child: CircularProgressIndicator(),
                                                      ):
                                                      Text('${_sizes.data[1].imgSize} Matte',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                      value: 2,
                                                    ),
                                                  ],
                                                  onChanged: (value) async{
                                                    setState(() {
                                                      _dropDownValue[index] = value;

                                                    });
                                                  },
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12.0),
                                              color: Color(0xffFF245E),
                                            ),
                                            child: RaisedButton(
                                              onPressed: (){},
                                              color: Color(0xffFF245E),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                              child: Text(
                                                'ADD NEW SIZE',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );


              }
              else{
                return Center(child: CircularProgressIndicator());
              }

            },
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlaceOrderScreen()),
                    );
                  },
                  child: Text(
                    'Proceed to Payment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              )
          ),
        )
    );
  }

  Future<void> fetchSize() async {
     _sizes=await showSizes();


    return _sizes;
  }
}