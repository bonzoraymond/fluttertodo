import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.usernameController, required String btnLabel,
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print("Button Clicked ${usernameController.text}");
        },
        child: const Text("Login"));
  }
}

//class customButton extends StatelessWidget {
//final String label;
//final VoidCallback?action;
//super.key,
//required this.label,
//this.action,
//return ElevatedButton(Onpressed: action, child: CustomText(label: label));
