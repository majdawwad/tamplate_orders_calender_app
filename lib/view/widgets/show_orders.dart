import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tamplate_app/controller/order_controller.dart';

import '../../../view/screens/orders_calender/widgets/order_tile.dart';

class ShowOrders extends StatelessWidget {
  ShowOrders({Key? key, required this.selectedDate}) : super(key: key);
  final String selectedDate;
  final _orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: _orderController.orders.length,
          itemBuilder: (context, index) {
            var order = _orderController.orders[index];
            if (order.creatingOrderDate == selectedDate) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(seconds: 1),
                child: SlideAnimation(
                  curve: Curves.bounceIn,
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _orderController.delete(order);
                            _orderController.getOrders();
                          },
                          child: OrderTile(order: order),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      }),
    );
  }
}
