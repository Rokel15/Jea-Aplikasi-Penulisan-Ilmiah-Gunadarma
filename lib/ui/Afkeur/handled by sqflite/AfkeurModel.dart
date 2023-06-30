class AfkeurModel{
  int? id;
  String? startDate;
  int? jumlahAyam;
  int? status;
  String? endDate;
  int? mortalitas;
  String? entryTime;

  AfkeurModel({
    this.id,
    this.startDate,
    this.jumlahAyam,
    this.status,
    this.endDate,
    this.mortalitas,
    this.entryTime
  });

  //toJson
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['jumlahAyam'] = this.jumlahAyam;
    data['status'] = this.status;
    data['endDate'] = this.endDate;
    data['mortalitas'] = this.mortalitas;
    data['entryTime'] = this.entryTime;
    return data;
  }

  //fromJson
  AfkeurModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    startDate = json['startDate'];
    jumlahAyam = json['jumlahAyam'];
    status = json['status'];
    endDate = json['endDate'];
    mortalitas = json['mortalitas'];
    entryTime = json['entryTime'];
  }
}