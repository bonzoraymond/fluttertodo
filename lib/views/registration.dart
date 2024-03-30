import 'package:flutter/material.dart';
import 'package:dart_application_1/configs/constants.dart';
import 'package:dart_application_1/views/customtextfield.dart';
import 'package:dart_application_1/customtext.dart';
import 'package:dart_application_1/views/login.dart'; // Import login screen
import 'package:dart_application_1/views/dashboard.dart'; // Import dashboard screen

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daystar University App"),
        backgroundColor: primaryColor,
        foregroundColor: appWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 120,
                      width: 120,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      label: "Registration Screen",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Your registration form fields here...
                const CustomText(label: "First name"),
                CustomTextField(
                  controller: firstNameController,
                  hintMessage: "Enter first name",
                  icon: Icons.person_add,
                ),
                // More form fields...
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Second name"),
                // TextField(),
                CustomTextField(
                  controller: secondNameController,
                  hintMessage: "Enter second name",
                  icon: Icons.person_add_alt_1,

                  //icon: Icons.lock,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Phone number"),
                // TextField(),
                CustomTextField(
                  controller: phoneNumberController,
                  hintMessage: "Enter phone number",
                  icon: Icons.phone,

                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Email address"),
                // TextField(),
                CustomTextField(
                  controller: emailAddressController,
                  hintMessage: "Enter email address",
                  icon: Icons.email,

                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Password"),
                // TextField(),
                CustomTextField(
                  controller: passwordController,
                  hintMessage: "Enter password",
                  icon: Icons.lock,
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Re-enter Password"),
                // TextField(),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintMessage: "Enter password again",
                  icon: Icons.lock,
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    _register(context);
                  },
                  child: const Text("Register"),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomText(label: "Already have an account?"),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const CustomText(
                        label: "Login",
                        labelColor: primaryColor,
                      ),
                      onTap: () {
                        // Navigate back to the login screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) {
    // Perform registration logic here...

    // Once registration is successful, navigate to the dashboard screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ToDoListDashboard()),
    );
  }
}
