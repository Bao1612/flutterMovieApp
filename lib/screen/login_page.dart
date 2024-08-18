import 'package:codes/components/my_button.dart';
import 'package:codes/components/my_text_field.dart';
import 'package:codes/components/square_tile.dart';
import 'package:codes/controller/handle_login.dart';
import 'package:codes/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                'Login',
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
              const SizedBox(height: 10),

              //password text field
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),


              //sign in button
              MyButton(
                buttonText: 'Sign In',
                onTap: signUserIn,
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
                    'Not a member?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: navigateToRegisterScreen,
                    child: const Text(
                        'Register now',
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

  void  signUserIn() {
    if(usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please enter username or password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
          fontSize: 16,
          backgroundColor: Colors.grey[300]
      );
    } else {
      loginUser(context, usernameController.text, passwordController.text);
    }
  }

  void navigateToRegisterScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

}
