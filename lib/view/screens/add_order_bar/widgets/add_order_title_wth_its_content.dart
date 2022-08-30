import 'package:flutter/material.dart';

import '../../../../core/theme.dart';

class AddOrderTitleWithItsContent extends StatelessWidget {
  final String orderTitle;
  final String orderTitleContent;
  const AddOrderTitleWithItsContent(
      {Key? key, required this.orderTitle, required this.orderTitleContent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderTitle,
          style: orderTitleStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          orderTitleContent,
          style: orderContentTitleStyle,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
