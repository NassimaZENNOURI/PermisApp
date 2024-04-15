
class Schools {

  int? id;
  String? school_name;
  String? name ;
  String? email ;
  String? experience;
  String? address;
  String? city;
  String? phoneNo;
  String? logo;
  String? founded;
  String? workingTime;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? role ;
  int? userId;

  Schools({
    this.name,
    this.email,
      this.id,
      this.school_name,
      this.experience,
      this.address,
      this.city,
      this.phoneNo,
      this.logo,
      this.founded,
      this.workingTime,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
    this.role,
      this.userId
  });

  Schools.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    school_name = json['school_name'];
    name = json['name'];
    email = json['email'];
    experience = json['experience'];
    address = json['address'];
    city = json['city'];
    phoneNo = json['phoneNo'];
    logo = json['logo'];
    founded = json['founded'];
    workingTime = json['workingTime'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    userId = json['user_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_name'] = this.school_name;
    data['name'] =this.name;
    data['email'] = this.email;
    data['experience'] = this.experience;
    data['address'] = this.address;
    data['city'] = this.city;
    data['phoneNo'] = this.phoneNo;
    data['logo'] = this.logo;
    data['founded'] = this.founded;
    data['workingTime'] = this.workingTime;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role'] = this.role;
    data['user_id'] = this.userId;
    return data;
  }
}
