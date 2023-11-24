class UserModel {
  int id;
  String name;
  String email;
  String phone;

  UserModel(this.id, this.name, this.email, this.phone);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(map['id'], map['name'], map['email'], map['phone']);
  }
}
