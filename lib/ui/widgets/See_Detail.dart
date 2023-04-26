import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class See_Detail extends StatefulWidget {
  CollectionReference Activities;
  See_Detail({required this.Activities});

  @override
  State<See_Detail> createState() => _See_DetailState(Activities: Activities);
}

class _See_DetailState extends State<See_Detail> {
  CollectionReference Activities;
  _See_DetailState({required this.Activities});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3C486B),
        title: Text('Detail Activities'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
            decoration: BoxDecoration(
              color: Color(0xff354259),
              borderRadius: BorderRadius.circular(30)
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: Activities.snapshots(),
              builder: (_, snapshot){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data!.docs.map((e)
                  => null).toList()
                    //  Tanggal
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Icon(Icons.calendar_today_outlined),
                    //       Text(
                    //         'Tanggal',
                    //         style: GoogleFonts.lato(
                    //             textStyle: TextStyle(
                    //                 fontSize: 16,
                    //                 color: Colors.white
                    //             )
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Text(
                    //   'Gua Cape Bgst',
                    //   style: GoogleFonts.lato(
                    //       textStyle: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.white
                    //       )
                    //   ),
                    // ),

                );
              },
            )
          )
        ],
      ),
    );
  }
}


