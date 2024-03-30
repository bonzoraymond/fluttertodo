import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_application_1/views/login.dart'; // Import the login screen
import 'package:dart_application_1/views/registration.dart' as RegistrationView; // Import the registration screen with an alias
import 'package:dart_application_1/views/dashboard.dart';

void main() {
  runApp(GetMaterialApp(
    home: Login(),
    initialRoute: "/",
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
  ));
}

class Routes {
  static var routes = [
    GetPage(name: "/", page: ()=>Login()),
    GetPage(name: "/registration", page: ()=>RegistrationView.RegistrationScreen()), // Use RegistrationScreen from the alias
    GetPage(name: "/dashboard", page: ()=>const ToDoListDashboard()),
    // Other routes...
  ];
}
