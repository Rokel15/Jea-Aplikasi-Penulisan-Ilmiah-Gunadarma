import 'package:flutter/material.dart';

class Afkeur extends StatefulWidget {
  const Afkeur({Key? key}) : super(key: key);

  @override
  State<Afkeur> createState() => _Afkeur();
}

class _Afkeur extends State<Afkeur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Afkeur'),
      ),
    );
  }
}
