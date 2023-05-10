import 'package:aplikasi_pi/ui/Articles/ShowArticle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:aplikasi_pi/ui/Articles/ArticleModel.dart';
import 'package:get/get.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _Articles();
}

class _Articles extends State<Articles> {

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
                padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 25),
                child: Center(
                    child: Text(
                      'This screen displays list of a few articles, click it therefore you can read the article you want',
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
                          'Articles',
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
                                Icons.article,
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
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Articles!',
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
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: MasonryGridView.count(
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        crossAxisCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listArticle.length,
                        itemBuilder: (context, index){
                          final article = listArticle[index];
                          return InkWell(
                            child: buildArticle(articleModel: article, index: index),
                            onTap: (){
                              Get.to(ShowArticle(articleModel: article));
                            },
                          );
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
}

class buildArticle extends StatelessWidget{
  ArticleModel articleModel;
  int index;

  buildArticle({
    required this.articleModel,
    required this.index,
  });

  Color? getColor(int index){
    switch(index % 4){
      case 0:
        return Colors.teal[300];
      case 1:
        return Color(0xffF45050);
      case 2:
        return Color(0xff9E6F21);
      case 3:
        return Color(0xff6D9886);
    }
  }

  double getMinHeight(int index){
    switch(index % 4){
      case 0:
        return 60;
      case 1:
        return 100;
      case 2:
        return 100;
      case 3:
        return 60;
      default:
        return 80;
    }
  }

  @override
  Widget build(BuildContext context){
    return Card(
      color: getColor(index),
      child: Container(
        constraints: BoxConstraints(
          minHeight: getMinHeight(index)
        ),
      ),
    );
  }
}