import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _Articles();
}

class _Articles extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Articles'),
      ),
    );
  }
}
