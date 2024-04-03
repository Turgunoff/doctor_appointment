//
// @Author: "Eldor Turgunov"
// @Date: 03.04.2024
// @File name: auth_model
//

class AuthModel{
  String? id;
  String email;
  String password;
  String? name;
  String? phone;

  AuthModel({
    this.id,
    required this.email,
    required this.password,
    this.name,
    this.phone,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    };
  }
}