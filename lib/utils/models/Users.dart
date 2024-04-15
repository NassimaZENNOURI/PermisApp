
class User {
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? status;
  String? created_at;
  String? updated_at;
  String? role;

  User({this.id,
    this.name,
    this.email,
    this.email_verified_at,
    this.status,
    this.created_at,
    this.updated_at,
    this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    email_verified_at= json['email_verified_at'];
    status = json['status'] ;
    created_at=json['created_at'];
    updated_at=json['updated_at'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at']=this.email_verified_at;
    data['status'] = this.status;
    data['created_at']=this.created_at;
    data['updated_at']=this.updated_at;
    data['role'] = this.role;
    return data;
  }
}