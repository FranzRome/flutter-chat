import 'package:chat/components/form_input_field.dart';
import 'package:chat/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Accedi",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                  key: _formKey,
                    child: Column(
                  children: [
                    FormInputField(
                        hintText: "Email",
                        iconData: Icons.email,
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Inserisci un'email valida";
                          }
                      }
                    ),
                    FormInputField(
                        hintText: "Password",
                        iconData: Icons.password,
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                    ),
                    const SizedBox(height: 20),
                    isLoading ? const CircularProgressIndicator() : ElevatedButton(onPressed: () async {
                      if(_formKey.currentState?.validate() == true) {
                        setState(() {
                          isLoading = true;
                        });
                        final loginSuccess = await AuthRepository.signIn(email!, password!);
                        setState(() {
                          isLoading = false;
                        });
                        if(loginSuccess) {
                          Navigator.of(context).pushNamed("/chat");
                        }
                        else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("Errore durante l'accesso")));
                        }
                      }
                    }, child: const Text("Accedi"))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
