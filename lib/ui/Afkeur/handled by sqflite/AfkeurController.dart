import 'package:get/get.dart';
import 'AfkeurModel.dart';
import 'DB.dart';

class AfkeurController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var AfkeurList = <AfkeurModel>[].obs;

  //get all the data from table
  void getAfkeurData() async{
    List<Map<String, dynamic>> AfkeurData = await DB.query();
    AfkeurList.assignAll(AfkeurData.map((data) => new AfkeurModel.fromJson(data)).toList());
  }

  /*input atau tambah data*/
  Future<int> addAfkeur({required AfkeurModel? afkeurModel}) async{
    // await DB.initDb();
    return await DB.insert(afkeurModel!);
  }

  //delete
  void delete(AfkeurModel afkeurModel) async{
    DB.delete(afkeurModel);
  }

  //update reset mortalitas
  void mortalitas0(int id) async{
    await DB.resetMortalitas(id);
  }

  //update kondisi menjadi 0
  void status0(int id) async{
    await DB.updateStatus0(id);
  }

  //update kondisi menjadi 1
  void status1(int id) async{
    await DB.updateStatus1(id);
  }

  void status3(int id) async{
    await DB.updateStatus3(id);
  }
}