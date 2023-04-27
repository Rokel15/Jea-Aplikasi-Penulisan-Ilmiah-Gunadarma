import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class See_Detail extends StatelessWidget {
  // CollectionReference Activities;
  DocumentSnapshot documentSnapshot;
  See_Detail({
    required this.documentSnapshot
    // required this.Activities,
  });

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

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
            color: Color(0xff3C486B),
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30,),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)
                    )
                ),
                child: detail(
                  Ask_data: data,
                )
            ),
          ),
        ],
      ),
    );
  }
}

class detail extends StatelessWidget {
  Map<String, dynamic> Ask_data;
  detail({
    required this.Ask_data,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15, right: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Tanggal : ${Ask_data['Tanggal']}',
                  style: GoogleFonts.aboreto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Maintenance Sirkulasi Udara dan Pergantian Pakan Minum Pada Ayam'),
                Text('Status : '),
                Text('Nilai : ')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Vaksinasi dan Pemberian Obat Berkala Pada Ayam'),
                Text('Status : '),
                Text('Nilai : ')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Menjaga Kebersihan Rutin Kandang'),
                Text('Status : '),
                Text('Nilai : ')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pelebaran Sekat Kandang Ayam Berkala'),
                Text('Status : '),
                Text('Nilai : ')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check Kondisi Ayam (Sehat/Sakit/Mati'),
                Text('Status : '),
                Text('Nilai : ')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
