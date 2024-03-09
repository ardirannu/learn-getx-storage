import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/login_controller.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find();
  final box = GetStorage(); //getx storage

  @override
  Widget build(BuildContext context) {
    if(box.read('rememberMe') != null){ //check rememberMe sudah ada distorage atau belum
      //jika ada ambil datab remember me, lalu set ke controller
      loginController.emailC.text = box.read('rememberMe')['email'];
      loginController.passwordC.text = box.read('rememberMe')['password'];
      loginController.rememberMe.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          TextField(
            controller: loginController.emailC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          Obx(
            () => TextField(
              controller: loginController.passwordC,
              autocorrect: false,
              obscureText: loginController.isHiddenPassword.value,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Password"),
                suffixIcon: IconButton(
                  onPressed: () => loginController.isHiddenPassword.toggle(),
                  icon: Icon(loginController.isHiddenPassword.value
                    ? Icons.visibility_off
                    : Icons.remove_red_eye,),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Obx(
            () => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: loginController.rememberMe.value,
              onChanged: (value) {
                loginController.rememberMe.toggle();
              },
              title: Text("Remember me"),
              contentPadding: EdgeInsets.only(right: 10.0),
            ),
          ),
          SizedBox(height: 5,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 0, 136, 255),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () {
              loginController.login();
            }, 
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}