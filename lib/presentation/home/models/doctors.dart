//
// @Author: "Eldor Turgunov"
// @Date: 16.03.2024
//

class Doctor {
  final String? userName;

  Doctor({
    this.userName,
  });

  factory Doctor.fromFirestore(Map<String, dynamic> data) {
    return Doctor(
      userName: data['userName'],
    );
  }
}
