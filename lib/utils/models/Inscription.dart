class Inscription {
  int? id;
  String? fullname;
  String? phoneNo;
  String? email;
  String? schoolName;
  String? address;
  String? city;
  String? type;
  int? status;
  String? createdAt;
  String? updatedAt;

  Inscription(
      {this.id,
        this.fullname,
        this.phoneNo,
        this.email,
        this.schoolName,
        this.address,
        this.city,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt});

  Inscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    schoolName = json['schoolName'];
    address = json['address'];
    city = json['city'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    data['schoolName'] = this.schoolName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}