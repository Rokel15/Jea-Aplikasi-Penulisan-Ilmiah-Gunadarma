import 'package:aplikasi_pi/ui/Afkeur/handled%20by%20sqflite/AfkeurModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'handled by sqflite/AfkeurController.dart';

class addData_Afkeur extends StatefulWidget {
  const addData_Afkeur({Key? key}) : super(key: key);

  @override
  State<addData_Afkeur> createState() => _addData_AfkeurState();
}

class _addData_AfkeurState extends State<addData_Afkeur> {

  final AfkeurController afkeurController = Get.put(AfkeurController());

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
    DateTime? setTglBerakhir = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));

    if (setTglBerakhir != null && setTglBerakhir != DateTime.now()) {
      setState(() {
        endDate = DateFormat.yMMMd().format(setTglBerakhir).toString();
      });
    }
  }

  TextEditingController inputJumlah_controller = TextEditingController();

  List<String> listKondisi = ['pilih kondisi','produktif', 'tidak produktif'];
  int valKondisi = 0;
  String kondisiAwal = 'pilih kondisi';
  void onChanged_kondisi(String? value){
    setState(() {
      kondisiAwal = value!;
      if(kondisiAwal=='produktif'){
        valKondisi = 1;
      } else{
        valKondisi = 0;
      }
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
        color: Color(0xff3F497F),
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add new data',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                            ),
                            Icon(Icons.edit)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mulai :',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '${startDate}',
                                    style: startDate=='atur tanggal mulai'?
                                    GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey
                                    ):
                                    GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    ),
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
                    padding: EdgeInsets.only(top: 5, bottom: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Perkiraan Berakhir :',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '$endDate',
                                    style: endDate=='atur tanggal perkiraan berakhir'?
                                    GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                        )
                                    ):
                                    GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    ),
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
                    padding: EdgeInsets.only(top: 5, bottom: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah :',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 5),
                                  child: TextFormField(
                                    controller: inputJumlah_controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                                    ],
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600
                                        )
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'masukkan jumlah anak ayam',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kondisi :',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: DropdownButton(
                                        value: kondisiAwal,
                                        items: listKondisi.map((String e)
                                        => DropdownMenuItem(
                                            value: e,
                                            child: Text(e)
                                        )).toList(),
                                        onChanged: (String? value){
                                          onChanged_kondisi(value);
                                        },
                                      ),
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
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
                              ),
                              onTap: (){
                                if(startDate=='atur tanggal mulai'){
                                  Get.snackbar(
                                      'Required',
                                      'All fields required',
                                      colorText: Colors.black,
                                      backgroundColor: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: Icon(Icons.warning, color: Colors.black,)
                                  );
                                }
                                else if(endDate=='atur tanggal perkiraan berakhir'){
                                  Get.snackbar(
                                      'Required',
                                      'All fields required',
                                      colorText: Colors.black,
                                      backgroundColor: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: Icon(Icons.warning, color: Colors.black,)
                                  );
                                }
                                else if(inputJumlah_controller.text.isEmpty){
                                  Get.snackbar(
                                      'Required',
                                      'All fields required',
                                      colorText: Colors.black,
                                      backgroundColor: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: Icon(Icons.warning, color: Colors.black,)
                                  );
                                }
                                else{
                                  add_toTable();
                                  Get.back();
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff3C486B),
        onPressed: (){
          Get.back();
        },
      ),
    );
  }

  add_toTable() async{
    await afkeurController.addAfkeur(
      afkeurModel: AfkeurModel(
          startDate: startDate,
          jumlahAyam: int.parse(inputJumlah_controller.text),
          kondisi: valKondisi,
          endDate: endDate),
    );
    afkeurController.getAfkeurData();
  }
}