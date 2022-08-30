class Order {
  int? id;
  String? customerName;
  String? customerEmail;
  String? creatingOrderDate;
  String? creatingOrderTime;

  Order({
    this.id,
    this.customerName,
    this.customerEmail,
    this.creatingOrderDate,
    this.creatingOrderTime,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customerName'];
    customerEmail = json['customerEmail'];
    creatingOrderDate = json['creatingOrderDate'];
    creatingOrderTime = json['creatingOrderTime'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "customerName": customerName,
      "customerEmail": customerEmail,
      "creatingOrderDate": creatingOrderDate,
      "creatingOrderTime": creatingOrderTime,
    };
  }
}
