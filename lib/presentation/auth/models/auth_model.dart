//
// @Author: "Eldor Turgunov"
// @Date: 03.04.2024
// @File name: auth_model
//

import 'dart:ffi';

class AuthModel {
  String? id;
  String? email;
  String? password;
  String? full_name;
  String? phone;
  double? balance;
  int? payment_id;

  AuthModel({
    this.id,
    this.email,
    this.password,
    this.full_name,
    this.phone,
    this.balance,
    this.payment_id,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      full_name: json['full_name'],
      phone: json['phone'],
      balance: json['balance'],
      payment_id: json['payment_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'full_name': full_name,
      'phone': phone,
      'balance': balance,
      'payment_id': payment_id,
    };
  }
}
