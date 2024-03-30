import 'package:dart_application_1/utils/sharedpreferences.dart';
import 'package:dart_application_1/views/dashboard.dart';
import 'package:dart_application_1/views/registration.dart'; // Import the RegistrationScreen
import 'package:flutter/material.dart';
import 'package:dart_application_1/configs/constants.dart';
import 'package:dart_application_1/views/customtextfield.dart';
import 'package:dart_application_1/customtext.dart';
import 'package:get/get.dart';

MySharedPreferences myPres= MySharedPreferences();
TextEditingController usernameController=TextEditingController();

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myPres.getValue("Username").then((value) {
      usernameController.text=value;

    });
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daystar University App"),
        backgroundColor: primaryColor,
        foregroundColor: appWhiteColor,
        centerTitle: true,
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
                      label: "Login Screen",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Username"),
                CustomTextField(
                  controller: usernameController,
                  hintMessage: "Enter email or phone number",
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(label: "Password"),
                CustomTextField(
                  controller: passwordController,
                  hintMessage: "Enter password",
                  icon: Icons.lock,
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 10, // Adjusted height
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your forgot password logic here
                      },
                      child: const CustomText(
                        label: "Forgot password?",
                        fontSize: 14,
                        labelColor: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Add your recover password logic here
                      },
                      child: const CustomText(
                        label: "Recover",
                        fontSize: 14,
                        labelColor: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // customButton(
                //   usernameController: usernameController,
                //   btnLabel: 'Login', 
                // ),
                ElevatedButton(
                    onPressed: () {
                      // Navigate to registration screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ToDoListDashboard(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                // MaterialButton(onPressed: ()  {
                //       // Navigate to registration screen
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => ToDoListDashboard(),
                //         )
                //       );
                // }, child: Text("Login"),),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to registration screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: const Text('Create an account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void LoginIn() {
  myPres.writeValue("Username", usernameController.text).then((value) {

  Get.toNamed('/home');
});
}
