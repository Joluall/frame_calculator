class User {
  int userId;
  int employee;
  String name;
  String password;
  int category;

  User({this.userId, this.employee, this.name, this.password, this.category});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    employee = json['employee'];
    name = json['name'];
    password = json['password'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userId == null) {
      data['user_id'] = this.userId;
    }
    data['employee'] = this.employee;
    data['name'] = this.name;
    data['password'] = this.password;
    data['category'] = this.category;
    return data;
  }
}
