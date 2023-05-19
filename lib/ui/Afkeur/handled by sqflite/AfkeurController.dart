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

  //update kondisi menjadi 0
  void kondisi0(int id) async{
    await DB.updateKondisi0(id);
  }

  //update kondisi menjadi 1
  void kondisi1(int id) async{
    await DB.updateKondisi1(id);
  }
}
