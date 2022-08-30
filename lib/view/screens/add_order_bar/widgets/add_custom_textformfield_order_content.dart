import 'package:flutter/material.dart';

import '../../../../core/theme.dart';

class AddCustomTextFormFieldOrderContent extends StatelessWidget {
  const AddCustomTextFormFieldOrderContent(
      {Key? key,
      required this.orderTitle,
      required this.controller,
      required this.labelText,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.textValidator})
      : super(key: key);
  final String orderTitle;
  final TextEditingController controller;
  final String? textValidator;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final IconButton? suffixIcon;
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
        Container(
          margin: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return textValidator;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              labelText: labelText,
              hintText: hintText,
              alignLabelWithHint: false,
              filled: true,
              suffixIcon: suffixIcon,
            ),
            keyboardType: keyboardType,
            textInputAction: TextInputAction.done,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
