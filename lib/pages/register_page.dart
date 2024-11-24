import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  // Register method
  void register() async {
    // Get auth service
    final authService = AuthService();

    // Check if passwords match
    if (passwordController.text == confirmpasswordController.text) {
      try {
        // Try creating user
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        // Show success dialog
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Success"),
            content: Text("Account created successfully!"),
          ),
        );
      } catch (e) {
        // Display error dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          ),
        );
      }
    } else {
      // If passwords don't match, show error
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          content: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.person,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),

              // Message, app slogan
              Text(
                "Let's create an account for you",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),

              // Email textfield
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 25),

              // Password textfield
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // Confirm password textfield
              MyTextfield(
                controller: confirmpasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // Sign up button
              MyButton(
                text: "Sign Up",
                onTap: register, // Call the register method here
              ),
              const SizedBox(height: 25),

              // Already have an account? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
