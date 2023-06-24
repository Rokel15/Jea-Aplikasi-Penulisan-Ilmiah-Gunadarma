import 'package:aplikasi_pi/ui/Afkeur/handled%20by%20sqflite/DB.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_pi/ui/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DB.initDb();
  runApp(const aplikasi_pi());
}

class aplikasi_pi extends StatelessWidget {
  const aplikasi_pi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chicken Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Color(0xff3C486B),
          )
      ),
      home: Home(),
    );
  }
}