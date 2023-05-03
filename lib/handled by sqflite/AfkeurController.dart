import 'package:aplikasi_pi/handled%20by%20sqflite/AfkeurModel.dart';
import 'package:aplikasi_pi/handled%20by%20sqflite/DB.dart';
import 'package:get/get.dart';

class AfkeurController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var AfkeurList = <AfkeurModel>[].obs;

  /*input atau tambah data*/
  Future<int> addAfkeur({required AfkeurModel? afkeurModel}) async{
    return await DB.insert(afkeurModel!);
  }

}