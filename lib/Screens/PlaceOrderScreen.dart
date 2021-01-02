import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  bool checkboxValue = false;

  void initState(){
    var boolcheckboxValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.075,
                color: Color(0xffFF245E),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Name'
                            ),
                          ),

                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Email'
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Phone'
                                    ),
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Address'
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Address Line 2'
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'ZIP/Post Code'
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'City'
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'State/Province/Region'
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Country'
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Payment Options',
                              suffixIcon: Container(
                                padding: EdgeInsets.all(10),
                                width: 125,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              12
                                          )
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/Gmail.png',
                                                    ),
                                                    fit: BoxFit.cover
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.centerRight,
                                                child: Text('Pay',
                                                style: TextStyle(
                                                  fontSize: 20
                                                ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Icon(
                                          Icons.arrow_drop_down
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1
                      )
                    )
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '3@6x4 matte',
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      '1.05',
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '1@6x4 glossy',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '0.35',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Freight',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Please enter address',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Total (USD, including tax)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Please enter address',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 10
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFF245E),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffFF245E).withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      )
                    ]
                  ),
                  margin: EdgeInsets.only(
                      left: 240,
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: RaisedButton(
                    color: Color(0xffFF245E),
                    onPressed: (){},
                    child: Text(
                      'I Have a coupon',
                      style: TextStyle(
                        color: Colors.white
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
        CheckboxListTile(
          value: checkboxValue,
          onChanged: (val) {
            print(val);
            setState(() {
              checkboxValue = val;
            });
                },
          subtitle: !checkboxValue
              ? Text(
            'Required.',
            style: TextStyle(color: Colors.red),
          )
              : null,
          title: new Text(
            'I agree to the terms and & policy',
            style: TextStyle(
                fontSize: 14.0,
              fontWeight: FontWeight.w600
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Color(0xffFF245E),
        ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10
            ),
            child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
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
                child: Text('Confirm & Pay',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 20
                ),
                ),
              ),
          )
          ),
        ),
      ),
    );
  }
}

