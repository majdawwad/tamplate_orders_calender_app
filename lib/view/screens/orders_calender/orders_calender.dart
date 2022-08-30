import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'widgets/add_order_with_date_bar.dart';
import 'widgets/show_orders.dart';

class OrdersCalender extends StatefulWidget {
  const OrdersCalender({Key? key}) : super(key: key);

  @override
  State<OrdersCalender> createState() => _OrdersCalenderState();
}

class _OrdersCalenderState extends State<OrdersCalender> {
  String selectedDate = DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Orders calender',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          AddOrderWithDateBar(),
          _addDatePickerBar(),
          const SizedBox(
            height: 50,
          ),
          ShowOrders(selectedDate: selectedDate),
        ],
      ),
    );
  }

  Widget _addDatePickerBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Theme.of(context).primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          setState(() {
            selectedDate = DateFormat.yMMMMd().format(date);
          });
        },
      ),
    );
  }
}
