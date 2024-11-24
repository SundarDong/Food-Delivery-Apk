import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function() ? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController= TextEditingController();

  void login() async{
    //get instance of auth service 
    final authService = AuthService();

    //try sign in 
    try{
      await authService.signInWithEmailPassword(emailController.text, passwordController.text,
      );
    }

    //display any errors
    catch(e){
        showDialog(
          context: context,
          builder: (context)=>AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  //forgot password

  void forgotPw(){
    showDialog(
      context: context,
       builder: (context)=> AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("User tapped forget password."),
       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

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
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),

        
            //sign in button 
              MyButton(
                text: "Sign In", 
                onTap: login,
                ),
                const SizedBox(height: 25),
        
        
            //users register
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
                const SizedBox(width: 4),

                GestureDetector(
                  onTap: widget.onTap ,
                  child: Text("Register Now ?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ); 
  }
}