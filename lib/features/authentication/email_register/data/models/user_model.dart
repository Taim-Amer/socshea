class UserModel {
  String uID;
  String firstName;
  String lastName;
  String username;
  String phone;
  String image;
  String email;
  bool isVerified;

  UserModel({
    required this.uID,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.email,
    required this.image,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uID: json['uID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      isVerified: json['isVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phone': phone,
      'email': email,
      'image': image,
      'isVerified': isVerified,
    };
  }
}
