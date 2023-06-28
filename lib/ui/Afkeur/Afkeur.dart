import 'package:aplikasi_pi/ui/Afkeur/addData_Afkeur.dart';
import 'package:aplikasi_pi/ui/Afkeur/handled%20by%20sqflite/AfkeurController.dart';
import 'package:aplikasi_pi/ui/Afkeur/handled%20by%20sqflite/AfkeurModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikasi_pi/ui/Afkeur/handled by sqflite/DB.dart';

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

  int? inputMortalitas;
  Future<Null> input_Mortalitas(BuildContext context, AfkeurModel afkeurModel) async{
    var simpleDialog = SimpleDialog(
      title: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
          child: Text(
            'Input total Mortalitas di minggu ke 100',
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
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 2,
            color: Color(0xff3F497F)
          )
      ),
      children: <Widget>[
        Material(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                  decoration: InputDecoration(
                    labelText: 'total mortalitas',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    )
                  ),
                  onChanged: (String value){
                    setState(() {
                      inputMortalitas = int.parse(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20 ,bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff293462),
                      ),
                      child: Text(
                          'input',
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
                      DB.database!.rawUpdate(
                          '''UPDATE ${DB.tableName} SET mortalitas = ${inputMortalitas} WHERE id = ?''',[afkeurModel.id]
                      );
                      afkeurController.getAfkeurData();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 17,),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20 ,bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffFF4A4A),
                      ),
                      child: Text(
                          'cancel',
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
                  ),
                  SizedBox(width: 15,)
                ],
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

  final AfkeurController afkeurController = Get.put(AfkeurController());

  @override
  void initState(){
    super.initState();
    afkeurController.getAfkeurData();
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
              color: Color(0xff3F497F),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      children: [
                        Text(
                          'Deplesi',
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
              color: Color(0xff3F497F),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Deplesi List!',
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
                          Get.to(addData_Afkeur());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Obx((){
                return ListView.builder(
                  itemCount: afkeurController.AfkeurList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index){
                    AfkeurModel afkeurModel = afkeurController.AfkeurList[index];
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 18),
                              padding: EdgeInsets.only(top: 13, left: 15, right: 15, bottom: 13),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff3F497F)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${afkeurModel.startDate}  -  ${afkeurModel.endDate}',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            )
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.white,),
                                        onPressed: (){
                                          show_DeleteBottomSheet(context, afkeurController.AfkeurList[index]);
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jumlah Ayam :',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            )
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${afkeurModel.jumlahAyam} ekor ayam',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                )
                                            ),
                                          ),
                                          Text(
                                            '100%',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                )
                                            ),
                                          )
                                        ],
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    width: double.infinity,
                                    height: 2.5,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 13),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mortalitas minggu 100 :',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            )
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            afkeurModel.mortalitas==0?
                                            'Not Set'
                                                :
                                            '${afkeurModel.mortalitas} ekor ayam',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                )
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                child: Icon(
                                                  Icons.restart_alt,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                                onTap: (){
                                                  setState(() {

                                                    afkeurController.getAfkeurData();
                                                  });
                                                },
                                              ),
                                              SizedBox(width: 10,),
                                              GestureDetector(
                                                child: Icon(
                                                  Icons.edit_document,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                                onTap: (){
                                                  input_Mortalitas(context, afkeurModel);
                                                },
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 13),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jumlah ayam tersisa :',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            )
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            /*'${(afkeurModel.jumlahAyam ?? 0) - (afkeurModel.mortalitas ?? 0)}*/ 'ekor ayam',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                )
                                            ),
                                          ),
                                          Text(
                                            '?%',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                )
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    width: double.infinity,
                                    height: 2.5,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Text(
                                        'Status : ',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            )
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          afkeurModel.status==3?
                                          'Not Set'
                                              :
                                          afkeurModel.status==1?
                                          'Baik'
                                              :
                                          'Buruk',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                              )
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.warning_amber_outlined,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                        onTap: (){
                                          setState(() {

                                          });
                                        },
                                      ),
                                      SizedBox(width: 10,),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.restart_alt,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                        onTap: (){
                                          setState(() {
                                            afkeurController.status3(afkeurModel.id!);
                                            afkeurController.getAfkeurData();
                                          });
                                        },
                                      ),
                                      SizedBox(width: 10,),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.edit_document,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                        onTap: (){
                                          show_UpdateBottomSheet(context, afkeurModel);
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }),
            ),
          ],
        ),
      )
    );
  }

  show_DeleteBottomSheet(BuildContext context, AfkeurModel afkeurModel){
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height/5.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 7,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black
              ),
            ),
            Spacer(),
            Container(
              // width: double.infinity,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Apakah anda ingin mengapus?',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Update_and_Delete_button(
                      text: 'Yes',
                      color: Color(0xff293462),
                      onTap: () {
                        afkeurController.delete(afkeurModel);
                        afkeurController.getAfkeurData();
                        Get.back();
                      }
                  ),
                  Update_and_Delete_button(
                      text: 'No',
                      color: Color(0xffFF4A4A),
                      onTap: (){
                        Get.back();
                      }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  show_UpdateBottomSheet(BuildContext context, AfkeurModel afkeurModel){
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height/5.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 7,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
              ),
            ),
            Spacer(),
            Container(
              // width: double.infinity,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Status',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Update_and_Delete_button(
                      text: 'Baik',
                      color: Color(0xff293462),
                      onTap: (){
                        afkeurController.status1(afkeurModel.id!);
                        afkeurController.getAfkeurData();
                        Get.back();
                      }
                  ),
                  Update_and_Delete_button(
                      text: 'Buruk',
                      color: Color(0xffFF4A4A),
                      onTap: (){
                        afkeurController.status0(afkeurModel.id!);
                        afkeurController.getAfkeurData();
                        Get.back();
                      }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Update_and_Delete_button({
    required String text,
    required Color color,
    required Function() onTap}){
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width/2.8,
        height: MediaQuery.of(context).size.height/17,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                )
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}