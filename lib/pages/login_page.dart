import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo 
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox( height: 25,),

            //message,app slogan
            Text("Food Deliver App",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            ),
            const SizedBox(height: 25),
        

            //email textfield
           MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 25),
        
            //password textfiled
             MyTextfield(
                controller: passwordController,
                hintText: "Passwordr",
                obscureText: true,
              ),
              const SizedBox(height: 25),
        
            //sign in button 
        
        
            //users register
          ],
        ),
      ),
    ); 
  }
}