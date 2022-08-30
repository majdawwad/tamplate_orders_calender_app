import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../controller/order_controller.dart';

import '../../../../core/theme.dart';
import '../../../widgets/my_button.dart';
import '../../add_order_bar/add_order_bar.dart';

class AddOrderWithDateBar extends StatelessWidget {
  AddOrderWithDateBar({Key? key}) : super(key: key);
  final _orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
            label: "+ Add Order",
            onTap: () async {
              await Get.to(() => const AddOrderBar());
              _orderController.getOrders();
            },
          ),
        ],
      ),
    );
  }
}
