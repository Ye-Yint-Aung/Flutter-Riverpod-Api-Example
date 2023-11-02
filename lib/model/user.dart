class UserModel {
  int? id;
  String? userName;
  String? email;
  int? age;
  String? city;

  UserModel({this.id, this.userName, this.email, this.age, this.city});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userName = json['UserName'];
    email = json['Email'];
    age = json['Age'];
    city = json['City'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserName'] = userName;
    data['Email'] = email;
    data['Age'] = age;
    data['City'] = city;
    return data;
  }
}