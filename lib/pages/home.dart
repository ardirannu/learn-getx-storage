import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/login_controller.dart';

class HomePage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loginController.logout();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}