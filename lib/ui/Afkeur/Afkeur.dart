import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Afkeur extends StatefulWidget {
  const Afkeur({Key? key}) : super(key: key);

  @override
  State<Afkeur> createState() => _Afkeur();
}

class _Afkeur extends State<Afkeur> {

  Future<Null> Check_Afkeur(BuildContext context) async{
    var simpleDialog = SimpleDialog(
      title: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            'Check Activities',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                )
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      // backgroundColor: Colors.black87,
      children: <Widget>[
        Material(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                child: Center(
                    child: Text(
                      'This screen displays track records of employees daily values',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          )
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 25),
                child: Center(
                    child: Text(
                      'You can also delete the old track record and add a new track record or more',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          )
                      ),
                    )),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20 ,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[600]
                  ),
                  child: Text(
                      'Ok',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          )
                      )
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),

      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return simpleDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Material(
        color: Colors.white,
        child: ListView(
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
            ),
            //body
            Container(
              width: double.infinity,
              color: Color(0xff3C486B),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Afkeur List!',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      )
                                  )
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.help_outline,
                                ),
                                onTap: (){
                                  Check_Afkeur(context);
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add datum/data',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle_outline,
                            )
                          ],
                        ),
                        onTap: (){
                         showBottomSheet();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  String startDate = 'atur tanggal mulai';
  String endDate = 'atur tanggal perkiraan berakhir';

  Future<Null> pilihTanggalMulai(BuildContext context) async {
    DateTime? setTglMulai = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));

    if (setTglMulai != null && setTglMulai != DateTime.now()) {
      setState(() {
        startDate = DateFormat.yMMMd().format(setTglMulai).toString();
      });
    }
  }

  Future<Null> pilihTanggalBerakhir(BuildContext context) async {
    DateTime? setTglMulai = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));

    if (setTglMulai != null && setTglMulai != DateTime.now()) {
      setState(() {
        endDate = DateFormat.yMMMd().format(setTglMulai).toString();
      });
    }
  }

  showBottomSheet(){
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.7,
        padding: EdgeInsets.only(top: 25, left: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            ),
            border: Border.all(color: Colors.black)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mulai :'),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        border: Border.all(
                            width: 2,
                            color: Colors.black
                        )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child:
                          Text(
                            '${startDate}',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                              child: Icon(Icons.calendar_today_rounded),
                              onTap: (){
                                pilihTanggalMulai(context);
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Perkiraan Berakhir :'),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        border: Border.all(
                            width: 2,
                            color: Colors.black
                        )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$endDate',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            child: Icon(Icons.calendar_today_rounded),
                            onTap: (){
                              pilihTanggalBerakhir(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jumlah :'),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.black
                              )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.only(top: 13, left: 20, right: 20, bottom: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff3C486B),
                        ),
                        child: Text(
                          'add new',
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}