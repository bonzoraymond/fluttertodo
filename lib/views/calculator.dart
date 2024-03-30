import 'package:dart_application_1/configs/constants.dart';
import 'package:dart_application_1/controllers/calculatorcontroller.dart';
import 'package:dart_application_1/customtext.dart';
import 'package:dart_application_1/views/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//class Calculator extends StatefulWidget {
 // const Calculator({super.key});

  //@override
  //State<Calculator> createState() => _CalculatorState();
//}

class Calculator extends StatelessWidget {
  TextEditingController aController=TextEditingController();
  TextEditingController bController=TextEditingController();
  CalculatorController calculatorController=Get.put(CalculatorController());

  Calculator({super.key});
  //double sum=0.0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
    children: [
      const CustomText(label: "Enter a"),
      CustomTextField(
        controller:  aController, hintMessage: "value for a",),
      const CustomText(label: "Enter b"),
      CustomTextField(
        controller:  bController,
      hintMessage: "value for b",
      ),

      //CustomTextField(),
      const SizedBox(
        height: 10,
      
      ),
      MaterialButton(
        onPressed: () {
          double a=double.parse(aController.text);
          double b=double.parse(bController.text);
          
         // setState(() {
            double s=a+b;
            calculatorController.updateSum(s);
            calculatorController.updateA(a);
            calculatorController.updateB(b);
          //});
          //print("The sum is $sum");
        },
         height: 50,
         color: primaryColor,
         child: const Text("Calculate"),
         ),
         const SizedBox(height: 30,),
         Obx(()=>CustomText(label: "The sum of ${calculatorController.a.value} and ${calculatorController.b.value} is ${calculatorController.sum.value}"))
      //customButton(usernameController:"Calculate", btnLabel: btnLabel)
    ],
    ),
    ),);
  }
}