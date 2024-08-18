import 'package:codes/components/my_button.dart';
import 'package:codes/components/my_text_field.dart';
import 'package:codes/components/square_tile.dart';
import 'package:codes/controller/handle_login.dart';
import 'package:codes/screen/login_page.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final reConfirmPasswordController = TextEditingController();

  //sign user in method


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainTheme,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),

              const SizedBox(height: 75),

              //username  text field
              MyTextField(
                controller: usernameController,
                hintText:   'Username',
                obscureText: false,
              ),
              const SizedBox(height: 40),

              //password text field
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 40),

              //password text field
              MyTextField(
                controller: reConfirmPasswordController,
                hintText: 'Reconfirm Password',
                obscureText: true,
              ),


              const SizedBox(height: 25),


              //sign in button
              MyButton(
                buttonText: 'Register',
                onTap: registerUser,
              ),

              const SizedBox(height: 50),
              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or continue with',
                        style: TextStyle(color: Colors.white),),
                      ),
                      Expanded(child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ))
                    ]
                ),
              ),

              const SizedBox(height: 50),

              //google + apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 40),

                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),
              //not a member? register now

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have Account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: navigateToLoginScreen,
                    child: const Text(
                      'Sign in now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  void  registerUser() {
    // registerUser(context, usernameController.text, passwordController.text);
  }

  void navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

}
