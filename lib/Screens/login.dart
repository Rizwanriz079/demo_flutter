import 'package:demo/Constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Controllers/AuthController.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    // Perform API call to login
    final response = await http.post(
      Uri.parse(''),
      body: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final String token = response.body;
      // Store token using GetX
      Get.find<AuthController>().setToken(token);
      Get.toNamed('/Home2');
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                child: Image.asset(
                  'assets/a (1).jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login Or Register To Book Your Appointments',
                      style: kBoldText30,
                      textAlign: TextAlign.start,
                    ),
                    kheight30,
                    Text(
                      'Email',
                      style: ktextw400,
                    ),
                    kheight5,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Enter your email',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    kheight30,
                    Text(
                      'Password',
                      style: ktextw400,
                    ),
                    kheight5,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Enter Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Login',style: kBoldText20,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
