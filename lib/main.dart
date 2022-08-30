import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamplate_app/db/db_helper.dart';

import 'screens/orders_calender/orders_calender.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const OrdersCalender(),
    );
  }
}
