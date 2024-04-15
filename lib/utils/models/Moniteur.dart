
class Moniteur {
  int? id ;
  String? name ;
  String? email;
  int? status;
  String? role;
  int? userId;
  int? schoolId;
  String? photo;
  String? phoneNo;
  String? birthdate;
  int? sexe;
  String? cni;
  String? cniRecto;
  String? cniVerso;
  String? carteMoniteur;
  String? numeroCarteMoniteur;
  String? school_name;
  String? photoName ;
  String? carteMoniteurName ;
  String? cniVersoName;
  String? cniRectoName;

  Moniteur(
      {
        this.id,
        this.name,
        this.email,
        this.status,
        this.role,
        this.userId,
        this.schoolId,
        this.photo,
        this.phoneNo,
        this.birthdate,
        this.sexe,
        this.cni,
        this.cniRecto,
        this.cniVerso,
        this.carteMoniteur,
        this.numeroCarteMoniteur,
        this.school_name,
        this.photoName,
        this.carteMoniteurName,
        this.cniRectoName,
        this.cniVersoName
      });

  Moniteur.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name =json['name'];
    email =json['email'];
    status =int.parse(json['status']??'0');
    role =json['role'];
    userId = json['user_id'];
    schoolId = json['school_id'];
    photo = json['photo'];
    phoneNo = json['phoneNo'];
    birthdate = json['birthdate'];
    sexe = int.parse(json['sexe']);
    cni = json['cni'];
    cniRecto = json['cniRecto'];
    cniVerso = json['cniVerso'];
    carteMoniteur = json['carteMoniteur'];
    numeroCarteMoniteur = json['numeroCarteMoniteur'];
    school_name = json['school_name'];
    photoName = json['photoName'];
    carteMoniteurName = json['carteMoniteurName'];
    cniVersoName = json['cniVersoName'];
    cniRectoName =json['cniRectoName'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['role'] = this.role;
    data['user_id'] = this.userId;
    data['school_id'] = this.schoolId;
    data['photo'] = this.photo;
    data['phoneNo'] = this.phoneNo;
    data['birthdate'] = this.birthdate;
    data['sexe'] = this.sexe;
    data['cni'] = this.cni;
    data['cniRecto'] = this.cniRecto;
    data['cniVerso'] = this.cniVerso;
    data['carteMoniteur'] = this.carteMoniteur;
    data['numeroCarteMoniteur'] = this.numeroCarteMoniteur;
    data['school_name']=this.school_name;
    data['photoName']= this.photoName;
    data['carteMoniteurName'] = this.carteMoniteurName;
    data['cniVersoName'] = this.cniVersoName;
    data['cniRectoName'] = this.cniRectoName;
    return data;
  }
}