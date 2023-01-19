class UserModel {
  String? email;
  String? password;
  bool? isLogined;

  UserModel({this.email, this.password, this.isLogined});

  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password, 'isLogined': isLogined};

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        password: json['password'],
        isLogined: json['isLogined'],
      );
}
