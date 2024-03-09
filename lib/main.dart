import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/login_controller.dart';
import 'package:getx_storage/pages/home.dart';
import 'package:getx_storage/pages/login.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage(), binding: BindingsBuilder.put(() => LoginController())),
        GetPage(name: '/home', page: () => HomePage(),),
      ],
    );
  }
}