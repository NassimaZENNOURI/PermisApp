import 'package:permisapp/utils/models/school.dart';

import 'Candidat.dart';
import 'Cars.dart';
import 'Moniteur.dart';

class Seance {
  int? id;
  int? schoolId;
  int? periodId;
  int? moniteurId;
  String? dateStart;
  String? time;
  int? status;
  int? statusDmdCandidat;
  String? createdAt;
  String? updatedAt;
  int? carId;
  String? carName;
  String? moniteurName;
  String? schoolName;
  String? text;
  String? photo;
  Periods? periods;
  School? school;
  Moniteur? coach;
  Cars? car;
  String? car_brand;
  String? car_color;
  // Candidat? candidats;


  Seance(
      {this.id,
        this.schoolId,
        this.periodId,
        this.moniteurId,
        this.dateStart,
        this.time,
        this.status,
        this.statusDmdCandidat,
        this.createdAt,
        this.updatedAt,
        this.carId,
        this.carName,
        this.moniteurName,
        this.schoolName,
        this.text,
        this.photo,
        this.periods,
        this.school,
        this.coach,
        this.car,
        this.car_brand,
        this.car_color,
        // this.candidats
      });

  Seance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    periodId = json['period_id'];
    moniteurId = json['moniteur_id'];
    dateStart = json['date_start'];
    time = json['time'];
    status = json['status'];
    statusDmdCandidat = json['status_dmd_candidat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    carId = json['car_id'];
    carName = json['car_name'];
    moniteurName = json['moniteur_name'];
    schoolName = json['school_name'];
    text = json['text'];
    photo = json['photo'];
    periods = json['periods'] != null ? new Periods.fromJson(json['periods']) : null ;
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
    coach = json['moniteur'] != null ? new Moniteur.fromJson(json['moniteur']) : null;
    car = json['car'] != null ? new Cars.fromJson(json['car']) : null;
    car_brand = json['car_brand'];
    car_color = json['car_color'];
    // candidats = json['candidats'] != null ? new Candidat.fromJson(json['candidats']) : null ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['period_id'] = this.periodId;
    data['moniteur_id'] = this.moniteurId;
    data['date_start'] = this.dateStart;
    data['time'] = this.time;
    data['status'] = this.status;
    data['status_dmd_candidat'] = this.statusDmdCandidat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['car_id'] = this.carId;
    data['car_name'] = this.carName;
    data['moniteur_name'] = this.moniteurName;
    data['school_name'] = this.schoolName;
    data['text'] = this.text;
    data['photo'] = this.photo;
    if (this.periods != null) {
      data['periods'] = this.periods!.toJson();
    }
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    if (this.coach != null) {
      data['moniteur'] = this.coach!.toJson();
    }
    if (this.car != null) {
      data['car'] = this.car!.toJson();
    }
    data['car_brand'] = this.car_brand;
    data['car_color'] = this.car_color;
    // if (this.candidats != null){
    //   data['candidats'] = this.candidats!.toJson() ;
    // }
    return data;
  }
}

class Periods {
  int? id;
  String? text;
  String? createdAt;
  String? updatedAt;

  Periods({this.id, this.text, this.createdAt, this.updatedAt});

  Periods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class School {
  int? id;
  String? name;
  String? experience;
  String? address;
  String? city;
  String? phoneNo;
  String? logo;
  String? founded;
  String? wrokingTime;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? userId;

  School(
      {this.id,
        this.name,
        this.experience,
        this.address,
        this.city,
        this.phoneNo,
        this.logo,
        this.founded,
        this.wrokingTime,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userId});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    experience = json['experience'];
    address = json['address'];
    city = json['city'];
    phoneNo = json['phoneNo'];
    logo = json['logo'];
    founded = json['founded'];
    wrokingTime = json['wrokingTime'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['experience'] = this.experience;
    data['address'] = this.address;
    data['city'] = this.city;
    data['phoneNo'] = this.phoneNo;
    data['logo'] = this.logo;
    data['founded'] = this.founded;
    data['wrokingTime'] = this.wrokingTime;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    return data;
  }
}