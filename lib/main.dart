import 'package:flutter/material.dart';
import 'package:paymentmethod/bca.dart';
import 'package:get/get.dart';
import 'package:paymentmethod/permata.dart';
import 'bni.dart';
import 'bri.dart';
import 'mandiri.dart';

void main() {
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: paymentmethodbri(),
    );
  }
}
