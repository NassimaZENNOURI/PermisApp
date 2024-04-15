
import 'dart:convert';

Candidat candidatFromJson(String str) => Candidat.fromJson(json.decode(str));

String candidatToJson(Candidat data) => json.encode(data.toJson());

class Candidat {

  Candidat({
    this.id,
    this.userId,
    this.schoolId,
    this.photo,
    this.phoneNo,
    this.birthdate,
    this.sexe,
    this.cni,
    this.cniRecto,
    this.cniVerso,
    this.contrat,
    this.certificat,
    this.tarifs,
    this.paid,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.name,
    this.schoolName,
    this.photoName,
    this.cniRectoName,
    this.cniVersoName,
    this.contratName,
    this.certificatName,
  });

  int? id;
  int? userId;
  int? schoolId;
  String? photo;
  String? phoneNo;
  String? birthdate;
  String? sexe;
  String? cni;
  String? cniRecto;
  String? cniVerso;
  String? contrat;
  String? certificat;
  int? tarifs;
  int? paid;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? name;
  String? schoolName;
  String? photoName;
  String? cniRectoName;
  String? cniVersoName;
  String? contratName;
  String? certificatName;

  Candidat copyWith({
    int? id,
    int? userId,
    int? schoolId,
    String? photo,
    String? phoneNo,
    String? birthdate,
    String? sexe,
    String? cni,
    String? cniRecto,
    String? cniVerso,
    String? contrat,
    String? certificat,
    int? tarifs,
    int? paid,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? email,
    String? name,
    String? schoolName,
    String? photoName,
    String? cniRectoName,
    String? cniVersoName,
    String? contratName,
    String? certificatName,
  }) =>
      Candidat(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        schoolId: schoolId ?? this.schoolId,
        photo: photo ?? this.photo,
        phoneNo: phoneNo ?? this.phoneNo,
        birthdate: birthdate ?? this.birthdate,
        sexe: sexe ?? this.sexe,
        cni: cni ?? this.cni,
        cniRecto: cniRecto ?? this.cniRecto,
        cniVerso: cniVerso ?? this.cniVerso,
        contrat: contrat ?? this.contrat,
        certificat: certificat ?? this.certificat,
        tarifs: tarifs ?? this.tarifs,
        paid: paid ?? this.paid,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        email: email ?? this.email,
        name: name ?? this.name,
        schoolName: schoolName ?? this.schoolName,
        photoName: photoName ?? this.photoName,
        cniRectoName : cniRectoName ?? this.photoName,
        contratName: contratName ?? this.contratName,
        certificatName: certificatName ?? this.certificatName,
      );

  factory Candidat.fromJson(Map<String, dynamic> json) => Candidat(
    id: json["id"],
    userId: json["user_id"],
    schoolId: json["school_id"],
    photo: json["photo"],
    phoneNo: json["phoneNo"],
    birthdate: json["birthdate"] ,
    sexe: json["sexe"],
    cni: json["cni"],
    cniRecto: json["cniRecto"],
    cniVerso: json["cniVerso"],
    contrat: json["contrat"],
    certificat: json["certificat"],
    tarifs: json["tarifs"],
    paid: json["paid"],
    status: json["status"],
    createdAt: json["created_at"] ,
    updatedAt: json["updated_at"] ,
    email: json["email"],
    name: json["name"],
    schoolName: json["school_name"],
    photoName: json['photoName'],
    cniRectoName: json['cniRectoName'],
    cniVersoName: json['cniVersoName'],
    contratName: json['contratName'],
    certificatName: json['certificatName'],
  );

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "school_id": schoolId,
    "photo": photo,
    "phoneNo": phoneNo,
    "birthdate": birthdate,
    "sexe": sexe,
    "cni": cni,
    "cniRecto": cniRecto,
    "cniVerso": cniVerso,
    "contrat": contrat,
    "certificat": certificat,
    "tarifs": tarifs,
    "paid": paid,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "email": email,
    "name": name,
    "school_name": schoolName,
    "photoName" : photoName,
    "cniRectoName": cniRectoName,
    "cniVersoName" :cniVersoName,
    "contratName":contratName,
    "certificatName":certificatName,
  };
}