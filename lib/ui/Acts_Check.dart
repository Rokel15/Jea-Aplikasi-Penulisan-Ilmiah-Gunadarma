import 'package:aplikasi_pi/ui/listing_Acts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Acts_Checks extends StatefulWidget {
  Acts_Checks({Key? key}) : super(key: key);

  @override
  State<Acts_Checks> createState() => _Acts_ChecksState();
}

class _Acts_ChecksState extends State<Acts_Checks> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Activities = firestore.collection('Activities');
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 40),
            color: Color(0xff3C486B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Activities',
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
                          Icons.list_alt,
                          size: MediaQuery.of(context).size.width / 5.2,
                        )
                      ),
                    ),
                  ]
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keterangan',
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
                        padding: EdgeInsets.only(top: 11, left: 15, bottom: 11),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.width / 12,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Max. Val = 100',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.width / 12,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.pink[600],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Max. Val = 80',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xff3C486B),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: Activities.snapshots(),
                builder: (_, snapshot){
                  return ListView(
                    children: snapshot.data!.docs.map((e)
                    => dataBuilder(tanggal: (e.data() as dynamic)['Tanggal'])).toList().cast<Widget>()
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff3C486B),
        onPressed: (){
          Get.to(listing_Acts(Activities: Activities));
        },
      ),
    );
  }
}

class dataBuilder{

  String tanggal;

  dataBuilder({required this.tanggal});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text('$tanggal'),
    );
  }
}