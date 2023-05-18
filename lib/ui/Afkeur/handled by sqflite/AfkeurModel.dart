class AfkeurModel{
  int? id;
  String? startDate;
  int? jumlahAyam;
  int? kondisi;
  String? endDate;

  AfkeurModel({
    this.id,
    required this.startDate,
    required this.jumlahAyam,
    required this.kondisi,
    required this.endDate,
  });

  //toJson
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['jumlahAyam'] = this.jumlahAyam;
    data['kondisi'] = this.kondisi;
    data['endDate'] = this.endDate;
    return data;
  }

  //fromJson
  AfkeurModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    startDate = json['startDate'];
    jumlahAyam = json['jumlahAyam'];
    kondisi = json['kondisi'];
    endDate = json['endDate'];
  }
}