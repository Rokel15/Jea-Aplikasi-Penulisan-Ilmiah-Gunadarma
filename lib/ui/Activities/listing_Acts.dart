import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class listing_Acts extends StatefulWidget {
  CollectionReference Activities;
  listing_Acts({required this.Activities});

  @override
  State<listing_Acts> createState() => _listing_ActsState(Activities: Activities);
}

class _listing_ActsState extends State<listing_Acts> {

  CollectionReference Activities;
  _listing_ActsState({required this.Activities});

  final String isiKegiatan1 = '''Maintenance Sirkulasi Udara dan Pergantian Pakan Minum Pada Ayam''';
  final String isiKegiatan2 = '''Vaksinasi dan Pemberian Obat Berkala Pada Ayam''';
  final String isiKegiatan3 = '''Menjaga Kebersihan Rutin Kandang''';
  final String isiKegiatan4 = '''Pelebaran Sekat Kandang Ayam Berkala''';
  final String isiKegiatan5 = '''Check Kondisi Ayam (Sehat/Sakit/Mati)''';

  bool? Kegiatan1 = false;
  bool? Kegiatan2 = false;
  bool? Kegiatan3 = false;
  bool? Kegiatan4 = false;
  bool? Kegiatan5 = false;

  String? Tugas1, Tugas2, Tugas3, Tugas4, Tugas5;

  int score = 20;

  int scoreAct1 = 0;
  int scoreAct2 = 0;
  int scoreAct3 = 0;
  int scoreAct4 = 0;
  int scoreAct5 = 0;

  DateTime tanggal = DateTime.now();
  String tanggalTxt = 'Atur tanggal';
  String inputTgl = 'Kesalahan Input';

  Future<Null> pilihTanggal(BuildContext context) async {
    DateTime? setTgl = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));

    if(setTgl !=null && setTgl != tanggal){
      setState(() {
        tanggal = setTgl;
        tanggalTxt = DateFormat.yMd().format(tanggal).toString();
        inputTgl = DateFormat.yMd().format(tanggal).toString();
      });
    }
  }

  int pilihKategori = 0;

  void onKegiatan1(bool? value1){
    setState(() {
      this.Kegiatan1 = value1;
      if(Kegiatan1==true){
        Tugas1 = isiKegiatan1;
        scoreAct1  = 20;
      } else{
        Tugas1 = '';
        scoreAct1 = 0;
      }
    });
  }

  void onKegiatan2(bool? value2){
    setState(() {
      this.Kegiatan2 = value2;
      if (Kegiatan2==true){
        Tugas2 = isiKegiatan2;
        scoreAct2 = 20;
      } else{
        Tugas2 = '';
        scoreAct2 = 0;
      }
    });
  }

  void onKegiatan3(bool? value3){
    setState(() {
      this.Kegiatan3 = value3;
      if (Kegiatan3==true){
        Tugas3 = isiKegiatan3;
        scoreAct3 = 20;
      } else{
        Tugas3 = '';
        scoreAct3 = 0;
      }
    });
  }

  void onKegiatan4(bool? value4){
    setState(() {
      this.Kegiatan4 = value4;
      if(Kegiatan4==true){
        Tugas4 = isiKegiatan4;
        scoreAct4 = 20;
      } else{
        Tugas4 = '';
        scoreAct4 = 0;
      }
    });
  }

  void onKegiatan5(bool? value5){
    setState(() {
      this.Kegiatan5 = value5;
      if(Kegiatan5==true){
        Tugas5 = isiKegiatan5;
        scoreAct5 = 20;
      } else{
        Tugas5 = '';
        scoreAct5 = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //Head
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Activities List',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      )
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.list_alt,
                  color: Colors.white,
                  size: 24,
                )
              ]
            ),
            color: Color(0xff3C486B),
          ),

          //Body
          Container(
            width: double.infinity,
            color: Color(0xff3C486B),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  //Atur Tanggal
                  Container(
                    width:double.infinity,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child:
                    ListTile(
                      title: Text(
                        '${this.tanggalTxt}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black,
                          ),
                          onPressed: (){
                            pilihTanggal(context);
                          }
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Kegiatan 1
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        '${this.isiKegiatan1}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                      subtitle: Text(
                        'Nilai : ${this.score}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            )
                        ),
                      ),
                      trailing: Checkbox(
                          side: BorderSide(
                            color: Color(0xff3C486B),
                            width: 2
                          ),
                          shape: ContinuousRectangleBorder(),
                          activeColor: Color(0xff3C486B),
                          value: Kegiatan1,
                          onChanged: (bool? value1){
                            onKegiatan1(value1);
                          }
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Kegiatan 2
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        '${isiKegiatan2}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                      subtitle: Text(
                        'Nilai : ${score}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            )
                        ),
                      ),
                      trailing: Checkbox(
                          side: BorderSide(
                              color: Color(0xff3C486B),
                              width: 2
                          ),
                          shape: ContinuousRectangleBorder(),
                          activeColor: Color(0xff3C486B),
                          value: Kegiatan2,
                          onChanged: (bool? value2){
                            onKegiatan2(value2);
                          }
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Kegiatan 3
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        '${isiKegiatan3}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                      subtitle: Text(
                        'Nilai : ${score}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            )
                        ),
                      ),
                      trailing: Checkbox(
                          side: BorderSide(
                              color: Color(0xff3C486B),
                              width: 2
                          ),
                          shape: ContinuousRectangleBorder(),
                          activeColor: Color(0xff3C486B),
                          value: Kegiatan3,
                          onChanged: (bool? value3){
                            onKegiatan3(value3);
                          }
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Kegiatan 4
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        '${isiKegiatan4}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                      subtitle: Text(
                        'Nilai : ${score}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            )
                        ),
                      ),
                      trailing: Checkbox(
                          side: BorderSide(
                              color: Color(0xff3C486B),
                              width: 2
                          ),
                          shape: ContinuousRectangleBorder(),
                          activeColor: Color(0xff3C486B),
                          value: Kegiatan4,
                          onChanged: (bool? value4){
                            onKegiatan4(value4);
                          }
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Kegiatan 5
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        '${isiKegiatan5}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                      subtitle: Text(
                        'Nilai : ${score}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            )
                        ),
                      ),
                      trailing: Checkbox(
                          side: BorderSide(
                              color: Color(0xff3C486B),
                              width: 2
                          ),
                          shape: ContinuousRectangleBorder(),
                          activeColor: Color(0xff3C486B),
                          value: Kegiatan5,
                          onChanged: (bool? value5){
                            onKegiatan5(value5);
                          }
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Klasifikasi
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        'Kategori',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                      trailing: Wrap(
                          children: List<Widget>.generate(
                              2,
                                  (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Container(
                                      height: MediaQuery.of(context).size.width / 15,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: index==0?Colors.pink[600]:Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: pilihKategori==index?
                                      Icon(Icons.done, color: Colors.white, size: 28,):Container(),
                                    ),
                                    onTap: (){
                                      setState(() {
                                        pilihKategori = index;
                                      });
                                    },
                                  )
                                );
                              }
                          )
                      ),
                    )

                  ),
                  Divider(
                    thickness: 2.5,
                    color: Colors.black,
                  ),

                  //Total Scroe
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                      leading: Text(
                        'Total Nilai : ${scoreAct1+scoreAct2+scoreAct3+scoreAct4+scoreAct5}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      //Save Data
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff3C486B),
        onPressed: (){
          Activities.add({
            'Tanggal' : inputTgl,
            'Kegiatan 1' : Tugas1,
            'Kegiatan 2' : Tugas2,
            'Kegiatan 3' : Tugas3,
            'Kegiatan 4' : Tugas4,
            'Kegiatan 5' : Tugas5,
            'Total Nilai' : scoreAct1+scoreAct2+scoreAct3+scoreAct4+scoreAct5,
            'Kategori' : pilihKategori
          });
          Get.back();
        },
      ),
    );
  }
}