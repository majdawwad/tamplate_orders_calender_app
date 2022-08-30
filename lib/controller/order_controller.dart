import 'package:get/get.dart';

import '../data/db/db_helper.dart';
import '../data/models/order_model.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addOrder({Order? order}) async {
    return await DBHelper.insert(order);
  }

  void getOrders() async {
    List<Map<String, dynamic>> orderss = await DBHelper.query();
    orders.assignAll(
        orderss.map((orderData) => Order.fromJson(orderData)).toList());
  }

  Future<int> delete(Order order) async {
    return await DBHelper.delete(order);
  }
}
