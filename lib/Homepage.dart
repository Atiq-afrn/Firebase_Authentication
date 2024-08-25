import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
          Center(
            child: Text(
              "Home page",
              style: TextStyle(fontSize: 50),
            ),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
              Fluttertoast.showToast(msg: "user successfully signOut");
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 200),
                color: Colors.blue,
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
