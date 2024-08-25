import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';

class otpScreen extends StatefulWidget {
  String verificationid;
  otpScreen({super.key, required this.verificationid});

  @override
  State<otpScreen> createState() => _optScreenState();
}

class _optScreenState extends State<otpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 189, 255, 199),
            const Color.fromARGB(255, 220, 180, 243),
            const Color.fromARGB(255, 235, 180, 187)
          ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 100),
          child: Text(
            'OTP Screen',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 150, right: 190),
              child: Text(
                "verifiaction",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 100, top: 50),
              child: Text(
                "we sent verification code",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 240),
              child: Text(
                "87*****104",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "enter OTP here",
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: otpController.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then(
                        (value) => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Homepage()))
                            });
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Verify"))
          ],
        ),
      ],
    ));
  }
}
