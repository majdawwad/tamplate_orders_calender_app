import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../controller/order_controller.dart';
import '../../../core/theme.dart';

import '../../../data/models/order_model.dart';
import '../../widgets/my_button.dart';
import 'widgets/add_order_title_wth_its_content.dart';
import 'widgets/add_custom_textformfield_order_content.dart';

class AddOrderBar extends StatefulWidget {
  const AddOrderBar({Key? key}) : super(key: key);

  @override
  State<AddOrderBar> createState() => _AddOrderBarState();
}

class _AddOrderBarState extends State<AddOrderBar> {
  final OrderController _orderController = Get.put(OrderController());
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();

  TextEditingController customerNumberController = TextEditingController();

  TextEditingController tripNumberController = TextEditingController();

  TextEditingController tripDeparturePlaceController = TextEditingController();

  TextEditingController tripDestinationPlaceController =
      TextEditingController();
  TextEditingController passengersNumbersController = TextEditingController();
  TextEditingController bagsNumbersController = TextEditingController();
  TextEditingController orderNotesController = TextEditingController();
  TextEditingController creatingOrderDateController = TextEditingController();
  TextEditingController creatingOrderTimeController = TextEditingController();

  final List<String> carsTypes = [
    'Sedan',
    'Business Sedan',
    'Van',
    'Business Van',
    'First Class',
  ];
  final List<String> driversNames = [
    'Majd Awwad',
    'Jaafar Khalouf',
    'Ammar Jende',
    'Ali Ahmad',
    'Samer Ali',
    'Mohamad Mohammad',
    'Tareq Mahfoud',
    'Hussam Ali'
  ];

  String? selectedValueCar;
  String? selectedValueDriverName;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  void initState() {
    creatingOrderDateController.text = DateFormat.yMMMMd().format(selectedDate);
    creatingOrderTimeController.text =
        TimeOfDay(hour: selectedTime.hour, minute: selectedTime.minute)
            .toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Add order',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _addOrderInformations(context),
    );
  }

  Card _addOrderInformations(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      shadowColor: Theme.of(context).primaryColor,
      elevation: 3.0,
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          AddOrderTitleWithItsContent(
            orderTitle: "Order date : ",
            orderTitleContent: DateFormat.yMMMMd().format(DateTime.now()),
          ),
          AddOrderTitleWithItsContent(
            orderTitle: "Order time : ",
            orderTitleContent: DateFormat.jms().format(DateTime.now()),
          ),
          const AddOrderTitleWithItsContent(
            orderTitle: "Order generator : ",
            orderTitleContent: "Majd Awwad",
          ),
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Customer name : ",
            controller: customerNameController,
            textValidator: "You must be customer name",
            labelText: "Customer name",
            hintText: "Enter customer name ...",
            keyboardType: TextInputType.name,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Customer Email : ",
            controller: customerEmailController,
            textValidator: "You must be customer email",
            labelText: "Customer email",
            hintText: "Enter customer email ...",
            keyboardType: TextInputType.emailAddress,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Customer number : ",
            controller: customerNumberController,
            textValidator: "You must be customer number",
            labelText: "Customer number",
            hintText: "Enter customer number ...",
            keyboardType: TextInputType.number,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Trip number : ",
            controller: tripNumberController,
            textValidator: "You must be trip number",
            labelText: "Trip number",
            hintText: "Enter trip number ...",
            keyboardType: TextInputType.number,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Trip departure place : ",
            controller: tripDeparturePlaceController,
            textValidator: "You must be trip departure place",
            labelText: "Trip departure place",
            hintText: "Enter trip departure place ...",
            keyboardType: TextInputType.text,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Trip destination place : ",
            controller: tripDestinationPlaceController,
            textValidator: "You must be trip destination place",
            labelText: "Trip destination place",
            hintText: "Enter trip destination place ...",
            keyboardType: TextInputType.text,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cars types : ",
                style: orderTitleStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          "Select car type ...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: carsTypes
                      .map<DropdownMenuItem<String>>(
                          (String itemVal) => DropdownMenuItem<String>(
                                value: itemVal,
                                child: Text(
                                  itemVal,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                      .toList(),
                  value: selectedValueCar,
                  onChanged: (selectedNewValueItem) {
                    setState(() {
                      selectedValueCar = selectedNewValueItem as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.amber,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.amber,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Drivers names : ",
                style: orderTitleStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          "Select driver name ...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: driversNames
                      .map<DropdownMenuItem<String>>(
                          (String itemVal) => DropdownMenuItem<String>(
                                value: itemVal,
                                child: Text(
                                  itemVal,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                      .toList(),
                  value: selectedValueDriverName,
                  onChanged: (selectedNewValueItem) {
                    setState(() {
                      selectedValueDriverName = selectedNewValueItem as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.amber,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.amber,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Passengers number : ",
            controller: passengersNumbersController,
            textValidator: "You must be passengers number",
            labelText: "Passengers number",
            hintText: "Enter passengers number ...",
            keyboardType: TextInputType.number,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Bags number : ",
            controller: bagsNumbersController,
            textValidator: "You must be bags numbers",
            labelText: "Bags number",
            hintText: "Enter bags numbers ...",
            keyboardType: TextInputType.number,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Order notes : ",
            controller: orderNotesController,
            labelText: "Order note",
            hintText: "Enter order notes ...",
            keyboardType: TextInputType.text,
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Creating order date : ",
            controller: creatingOrderDateController,
            labelText: "Creating order date",
            hintText: "Enter creating order date ...",
            keyboardType: TextInputType.datetime,
            suffixIcon: IconButton(
              onPressed: () async => _selectDate(context),
              icon: const Icon(
                Icons.calendar_month_outlined,
              ),
            ),
          ),
          AddCustomTextFormFieldOrderContent(
            orderTitle: "Creating order time : ",
            controller: creatingOrderTimeController,
            labelText: "Creating order time",
            hintText: "Enter creating order time ...",
            keyboardType: TextInputType.datetime,
            suffixIcon: IconButton(
              onPressed: () async => _selectTime(context),
              icon: const Icon(
                Icons.access_time_filled_outlined,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: MyButton(
              label: "+ Add Order",
              onTap: () {
                return _addOrderToDB();
              },
            ),
          ),
        ],
      ),
    );
  }

  _addOrderToDB() async {
    int value = await _orderController.addOrder(
      order: Order(
        customerName: customerNameController.text,
        customerEmail: customerEmailController.text,
        creatingOrderDate: creatingOrderDateController.text,
        creatingOrderTime: creatingOrderTimeController.text,
      ),
    );
    print('My id is ' + '$value');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        creatingOrderDateController.text =
            DateFormat.yMMMMd().format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        creatingOrderTimeController.text =
            TimeOfDay(hour: selectedTime.hour, minute: selectedTime.minute)
                .toString();
      });
    }
  }
}
