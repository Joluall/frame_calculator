class Molding {
  int id;
  String name;
  double price;

  Molding({this.id, this.name, this.price});

  Molding.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
