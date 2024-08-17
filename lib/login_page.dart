import 'package:codes/components/my_button.dart';
import 'package:codes/components/my_text_field.dart';
import 'package:codes/components/square_tile.dart';
import 'package:codes/loginMethod.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),


              const SizedBox(height: 50),

              //welcome back, you've been missed!

              Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),

              ),

              const SizedBox(height: 25),


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
                      child: Text('Or continue with'),
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

                  SizedBox(width: 10),

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
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                      'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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
    loginUser(context, usernameController.text, passwordController.text);
  }

}
