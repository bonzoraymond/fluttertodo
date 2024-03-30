import 'package:dart_application_1/configs/constants.dart';
import 'package:dart_application_1/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:data_application_1/configs/constants.dart';

 LoginController loginController=Get.put(LoginController());

class CustomText extends StatelessWidget {
 
  final String label;//hintText 
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.label,
    this.labelColor = appGrey,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    //return TextField(

return SizedBox(
      child: Text(
        label,
        style: TextStyle(
            color: labelColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
);
  }
}
    //controller: controller, 
    //obscureText: isPassword,
     //decoration: InputDecoration(
    //border: OutlineInputBorder(),
//hintText: hint, 
//prefixIcon: Icon(icon),
//suffixIcon: Icon(preficon)),
     // InputDecoration
    //return SizedBox(
     // child: Text(
       // label,
        //style: TextStyle(
            //color: labelColor, fontSize: fontSize, fontWeight: fontWeight),
      //),
    //);
 // }
//}

