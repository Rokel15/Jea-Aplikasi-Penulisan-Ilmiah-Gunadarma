import 'package:aplikasi_pi/ui/Afkeur/Afkeur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_pi/ui/Activities/Acts_Check.dart';
import 'package:aplikasi_pi/ui/Articles/Articles.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Null> Welcome_to_App(BuildContext context) async{
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
            'Home Page',
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
                padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 25),
                child: Center(
                    child: Text(
                      'Welcome to the app, this screen is home page. The displays contains features introduction and features whatever you want to use directly',
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
      appBar: AppBar(
        title: Text('Chicken Care'),
        backgroundColor: Color(0xff3F497F),
      ),
      body: ListView(
        children: [
          //features
          Container(
            width: double.infinity,
            color: Color(0xff3F497F),
            padding: EdgeInsets.only(top: 45, bottom: 45),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //activities
                    GestureDetector(
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Activities',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              )
                            ),
                          )
                        ],
                      ),
                      onTap: (){
                        Get.to(Acts_Checks());
                      },
                    ),

                    //afkeur
                    GestureDetector(
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Afkeur',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                )
                            ),
                          )
                        ],
                      ),
                      onTap: (){
                        Get.to(Afkeur());
                      },
                    ),

                    //article
                    GestureDetector(
                      child: Column(
                        children: [
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
                                  Icons.article,
                                  size: MediaQuery.of(context).size.width / 5.2,
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Articles',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                )
                            ),
                          )
                        ],
                      ),
                      onTap: (){
                        Get.to(Articles());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Home
          Container(
            width: double.infinity,
            color: Color(0xff3C486B),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'About App',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                )
                              )
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.help_outline
                              ),
                              onTap: (){
                                Welcome_to_App(context);
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
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xff354259),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Activities',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                )
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: (){
                                Get.to(Acts_Checks());
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '> Memberikan pengawasan terhadap kegiatan karyawan secara berkala untuk menilai kondusifitas suasana kerja.',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '> Produktivitas menurun akibat suasana kerja yang tidak kondusif, tidak kondusif juga disebabakan kurangnya pengawasan.',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              )
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xff635985),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Afkeur',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  )
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: (){
                                Get.to(Afkeur());
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '> Pelepasan ayam untuk diambil dagingnya ketika ayam sudah tidak bagus masa produktivitasnya dalam menghasilkan telur ataupun karena harga telur di pasar yang rusak.',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              )
                          ),
                          textAlign: TextAlign.justify,
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff443C68),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Articles',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  )
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: (){
                                Get.to(Articles());
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '> Berisi kumpulan artikel seputar peternakan ayam.',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              )
                          ),
                          textAlign: TextAlign.justify,
                        ),

                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height /15,
                    color: Color(0xff3C486B),
                    child: Center(
                      child: Text(
                        'version 1.0',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}