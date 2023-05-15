import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class addData_Afkeur extends StatefulWidget {
  const addData_Afkeur({Key? key}) : super(key: key);

  @override
  State<addData_Afkeur> createState() => _addData_AfkeurState();
}

class _addData_AfkeurState extends State<addData_Afkeur> {

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
                  topRight: Radius.circular(28),
                  topLeft: Radius.circular(28)
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
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
          ),
      ),
    );
  }
}
