import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/opt.dart';

class OtpAuth extends StatefulWidget {
  const OtpAuth({super.key});

  @override
  State<OtpAuth> createState() => _optScreenState();
}

class _optScreenState extends State<OtpAuth> {
  TextEditingController phoneController = TextEditingController();
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
          margin: EdgeInsets.only(top: 50, left: 50),
          child: Text(
            'OTP Authentication',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 10,
          ),
          Column(children: [
            Container(
              margin: EdgeInsets.only(right: 180),
              child: Text(
                "you can verify here",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "enter phone number",
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationid, int? resendtoken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                otpScreen(verificationid: verificationid)));
                  },
                  codeAutoRetrievalTimeout: (String verificationid) {},
                  phoneNumber: phoneController.text.toString(),
                );
              },
              child: Text(
                "verify",
                style: TextStyle(fontSize: 20),
              ))
        ])
      ],
    ));
  }
}
