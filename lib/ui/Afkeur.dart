import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Afkeur extends StatefulWidget {
  const Afkeur({Key? key}) : super(key: key);

  @override
  State<Afkeur> createState() => _Afkeur();
}

class _Afkeur extends State<Afkeur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: [
          //head
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 14, left: 15, right: 15, bottom: 30),
            color: Color(0xff3C486B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    children: [
                      Text(
                        'Afkeur',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        Center(
                            child: Icon(
                              Icons.date_range,
                              size: MediaQuery.of(context).size.width / 5.2,
                            )
                        ),
                      ),
                    ]
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
