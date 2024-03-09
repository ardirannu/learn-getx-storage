import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController
{
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  RxBool isHiddenPassword = true.obs;
  RxBool rememberMe = false.obs;

  void login () async {
    final box = GetStorage(); //getx storage

    if(emailC.text == 'admin@mail.com' && passwordC.text == 'admin'){
      if(box.read('rememberMe') != null){ //check rememberMe 
        box.remove('rememberMe');
      }

      if(rememberMe.isTrue){
        box.write( //write rememberMe to storage
          'rememberMe', 
          {
            'email': emailC.text,
            'password': passwordC.text,
          }
        );
      }

      Get.offAllNamed('/home');
    }else{
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Email & Password tidak sesuai.',
      );
    }
  }

  void logout () {
    Get.offAllNamed('/');
  }
}