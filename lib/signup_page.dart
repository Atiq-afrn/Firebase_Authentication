import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/firebase_services/auth_service.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final Firebaseservice _auth = Firebaseservice();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  void Dispose() {
    super.dispose();

    _usernamecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/textbook.jpg"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    //  padding: const EdgeInsets.only(left: 140, top: 20),
                    // decoration: const BoxDecoration(color: Colors.green),
                    child: const Text(
                      "Sign UP",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Center(
                  child: Container(
                    // padding: const EdgeInsets.only(left: 120, top: 20),
                    // decoration: const BoxDecoration(color: Colors.green),
                    child: const Text(
                      "Welcome !",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(left: 62, right: 65),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Container(
                    child: TextFormField(
                      controller: _usernamecontroller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: "User name....",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(left: 62, right: 65),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Container(
                    child: TextFormField(
                      controller: _emailcontroller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Email....",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(left: 62, right: 65),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.black38),
                  child: Container(
                    child: TextFormField(
                      controller: _passwordcontroller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: "password....",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 62, right: 65),
                  child: Center(
                      child: GestureDetector(
                    onTap: () async {
                      String username = _usernamecontroller.text;
                      String email = _emailcontroller.text;
                      String password = _passwordcontroller.text;
                      User? user = await _auth.signUpMethod(email, password);
                      if (user != null) {
                        Fluttertoast.showToast(
                            msg: 'User successfully created');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Homepage(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(msg: 'some error occured');
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account ",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
