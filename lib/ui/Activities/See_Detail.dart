import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class See_Detail extends StatelessWidget {

  DocumentSnapshot documentSnapshot;

  See_Detail({
    required this.documentSnapshot
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
          // Tanggal
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
          // Kegiatan 1
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Maintenance Sirkulasi Udara dan Pergantian Pakan Minum Pada Ayam',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text(
                  Ask_data['Kegiatan 1']=='Maintenance Sirkulasi Udara dan Pergantian Pakan Minum Pada Ayam'?
                  'Status\t: Dikerjakan' :'Status\t: Tidak Dikerjakan',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  Ask_data['Kegiatan 1']=='Maintenance Sirkulasi Udara dan Pergantian Pakan Minum Pada Ayam'?
                  'Nilai\t: 20':'Nilai\t: 0',
                )
              ],
            ),
          ),
          // Kegiatan 2
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Vaksinasi dan Pemberian Obat Berkala Pada Ayam',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ),
                ),
                Text(
                  Ask_data['Kegiatan 2']=='Vaksinasi dan Pemberian Obat Berkala Pada Ayam'?
                  'Status\t: Dikerjakan' :'Status\t: Tidak Dikerjakan',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    )
                  ),
                ),
                Text(Ask_data['Kegiatan 2']=='Vaksinasi dan Pemberian Obat Berkala Pada Ayam'?
                'Nilai\t: 20':'Nilai\t: 0',
                )
              ],
            ),
          ),
          // Kegiatan 3
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Menjaga Kebersihan Rutin Kandang',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text(
                  Ask_data['Kegiatan 3']=='Menjaga Kebersihan Rutin Kandang'?
                  'Status\t: Dikerjakan' :'Status\t: Tidak Dikerjakan',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  Ask_data['Kegiatan 3']=='Menjaga Kebersihan Rutin Kandang'?
                  'Nilai\t: 20':'Nilai\t: 0',
                )
              ],
            ),
          ),
          // Kegiatan 4
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Pelebaran Sekat Kandang Ayam Berkala',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ),
                ),
                Text(
                  Ask_data['Kategori']==0?
                  'Status\t: Dikerjakan':'Status\t: Belum waktunya',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    )
                  )
                ),
                Text(
                  Ask_data['Kegiatan 4']=='Pelebaran Sekat Kandang Ayam Berkala'?
                  'Nilai\t: 20':'Nilai\t: 0',
                )
              ],
            ),
          ),
          // Kegiatan 5
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Check Kondisi Ayam (Sehat/Sakit/Mati',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ),
                ),
                Text(Ask_data['Kegiatan 5']=='Check Kondisi Ayam (Sehat/Sakit/Mati)'?
                  'Status\t: Dikerjakan' :'Status\t: Tidak Dikerjakan',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(Ask_data['Kegiatan 5']=='Check Kondisi Ayam (Sehat/Sakit/Mati)'?
                'Nilai\t: 20':'Nilai\t: 0',
                )
              ],
            ),
          ),
          // Total Nilai
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, bottom: 15),
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black
            ),
          ),
          Text(
            'Total Nilai\t: ${Ask_data['Total Nilai']}',
            style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
