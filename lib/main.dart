import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/firebase_services/opt_service.dart';
import 'package:flutter_application_1/opt.dart';
//import 'package:firebase_app_check/firebase_app_check.dart';

import 'package:flutter_application_1/spalsh_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDPx1F4Dv_QBnaZD-O2MmPRYWTrHWgbVxs",
            appId: "1:893987720447:android:572eb996b031025a6910ca",
            messagingSenderId: "893987720447",
            projectId: "shafiqfirebase"));
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpAuth(),
    );
  }
}
