import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/firebase_services/auth_service.dart';
import 'package:flutter_application_1/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Firebaseservice _auth = Firebaseservice();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void Dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

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
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Center(
                  child: Container(
                    child: const Text(
                      "Welcome !",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
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
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Container(
                    child: TextFormField(
                      controller: _passwordcontroller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: "password....",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 62, right: 65),
                  child: Center(
                      child: GestureDetector(
                    onTap: () async {
                      String email = _emailcontroller.text;
                      String password = _passwordcontroller.text;
                      User? user = await _auth.signInMethod(email, password);
                      if (user != null) {
                        Fluttertoast.showToast(
                            msg: "user successfully loged in ");

                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Homepage()));
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.only(left: 62, right: 65),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: GestureDetector(
                    onTap: () async {
                      final GoogleSignIn g_sign_in = GoogleSignIn();
                      try {
                        final GoogleSignInAccount? g_sign_account =
                            await g_sign_in.signIn();
                        if (g_sign_account != null) {
                          final GoogleSignInAuthentication g_signin_auth =
                              await g_sign_account.authentication;
                          final AuthCredential credential =
                              GoogleAuthProvider.credential(
                                  idToken: g_signin_auth.idToken,
                                  accessToken: g_signin_auth.accessToken);
                          await _firebaseAuth.signInWithCredential(credential);
                        }
                      } catch (e) {
                        print("some error occured");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: const Color.fromARGB(255, 128, 50, 42),
                        ),
                        Text(
                          " Google Login",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account Click on ",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
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
