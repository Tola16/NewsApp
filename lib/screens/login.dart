import 'package:flutter/material.dart';
import 'package:newsapp/customs/customtextfromfield.dart';
import 'package:newsapp/providers/authprovider.dart';
import 'package:newsapp/screens/home.dart';
import 'package:provider/provider.dart';

class LoginScreens extends StatelessWidget {
  LoginScreens({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final providerObject = context.read<Authprovider>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: .bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              CustomField(
                label: "Email",
                icon: Icons.email,
                controller: email,
                obscure: false,
              ),
              CustomField(
                label: "PassWord",
                icon: Icons.password,
                controller: password,
                obscure: true,
              ),

              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final success = await providerObject.userLogin(
                      email: email.text,
                      password: password.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          providerObject.auth?.msg ?? 'Please try again',
                        ),
                        backgroundColor: success
                            ? Colors.green
                            : Colors.deepOrange,
                      ),
                    );

                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
