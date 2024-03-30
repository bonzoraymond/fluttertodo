import 'package:get/get.dart';
import 'package:dart_application_1/views/login.dart';
import 'package:dart_application_1/views/registration.dart'; // Import only from registration.dart
//import 'package:dart_application_1/views/home.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: ()=>Login()),
    //GetPage(name: "/home", page: ()=>Home()),
    //GetPage(name: "/calculator", page: ()=>Calculator()),
    GetPage(name: "/registration", page: ()=>RegistrationScreen()),
    //GetPage(name: "/dashboard", page: ()=>ToDoListDashboard()), // Use RegistrationScreen from registration.dart
    // Other routes...
  ];
}


    //GetPage(name: "/calculator", page: ()=>Calculator()),

