import 'package:flutter/material.dart';
import 'package:newsapp/customs/customtextfromfield.dart';
// import 'package:newsapp/main.dart';
import 'package:newsapp/providers/authprovider.dart';
import 'package:newsapp/screens/login.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> gkey = GlobalKey();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<Authprovider>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: gkey,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: 20),
              Text(
                "Sign Up",
                style: TextStyle(fontWeight: .bold, fontSize: 23),
              ),
              SizedBox(height: 10),

              CustomField(
                controller: email,
                icon: Icons.email,
                label: "Email",
                obscure: false,
              ),
              SizedBox(height: 10),
              CustomField(
                controller: userName,
                icon: Icons.person,
                label: "Name",
                obscure: false,
              ),
              SizedBox(height: 10),
              CustomField(
                controller: passWord,
                icon: Icons.lock,
                label: "PassWord",
                obscure: true,
              ),
              SizedBox(height: 10),
              CustomField(
                controller: phone,
                icon: Icons.phone,
                label: "Phone",
                obscure: false,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!gkey.currentState!.validate()) return;

                  final success = await provider.userRegister(
                    name: userName.text,
                    email: email.text,
                    phone: phone.text,
                    password: passWord.text,
                  );
                  final message = provider.auth!.msg;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreens()),
                    );
                  }
                },
                child: Text("SignUp"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
