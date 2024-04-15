import 'Users.dart';

class Facture extends User {
  int? id;
  int? userId;
  int? montant;
  int? montantpaye;
  int? montantreste;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? name;

  Facture(
      {this.id,
        this.userId,
        this.montant,
        this.montantpaye,
        this.montantreste,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.email,
        this.name});

  Facture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    montant = json['montant'];
    montantpaye = json['montantpaye'];
    montantreste = json['montantreste'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['montant'] = this.montant;
    data['montantpaye'] = this.montantpaye;
    data['montantreste'] = this.montantreste;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}