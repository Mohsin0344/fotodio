import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fotodio/Models/SignUpModel.dart';
import 'package:fotodio/Screens/ImagePickerScreen.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:http/http.dart' as http;

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

Future<SignUp> createUser(String mobile) async{
  final String apiUrl = "http://fotod.io/api/signup";
  final response = await http.post(apiUrl, body: {
    "mobile": mobile
  });

  if(response.statusCode == 200){
    final String responseString = response.body;
    return signUpFromJson(responseString);
  }else {
    return null;
  }
}

class _OTPScreenState extends State<OTPScreen> {
  SignUp _userId;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    //color: const Color.fromRGBO(43, 46, 66, 1),
    color: Colors.blue.withOpacity(0.2),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Center(child:Text('OTP Verification')),
          backgroundColor: Color(0xffFF245E),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Verify +92-${widget.phone}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImagePickerScreen()
                            ),
                            (route) => false);
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldkey.currentState
                        .showSnackBar(SnackBar(content: Text('invalid OTP')));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {


    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {

              SignUp userid=await createUser(value.user.phoneNumber);

              print(userid.status);

              setState(() {

                _userId=userid;

              });
              print("${_userId.user[0].userId}");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ImagePickerScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
