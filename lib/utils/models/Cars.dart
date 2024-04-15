

class Cars {
  int? id;
  int? schoolId;
  String? photo;
  String? brand;
  String? version;
  String? engine;
  String? color;
  String? matricule;
  String? kilometrage;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? photoName ;

  Cars(
      {this.id,
        this.schoolId,
        this.photo,
        this.brand,
        this.version,
        this.engine,
        this.color,
        this.matricule,
        this.kilometrage,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.photoName
      });

  Cars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    photo = json['photo'];
    brand = json['brand'];
    version = json['version'];
    engine = json['engine'];
    color = json['color'];
    matricule = json['matricule'];
    kilometrage = json['kilometrage'];
    status = int.parse(json['status']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photoName = json['photoName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['photo'] = this.photo;
    data['brand'] = this.brand;
    data['version'] = this.version;
    data['engine'] = this.engine;
    data['color'] = this.color;
    data['matricule'] = this.matricule;
    data['kilometrage'] = this.kilometrage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['photoName'] = this.photoName;
    return data;
  }
}