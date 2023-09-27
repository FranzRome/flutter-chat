import 'package:chat/components/form_input_field.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;

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
                  "Crea il tuo account",
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
                        validator: (value) {
                          if(value == null || value.length<6) {
                            return "Inserisci una password di almeno 6 caratteri";
                          }
                        }
                    ),
                    FormInputField(
                        hintText: "Conferma Password",
                        iconData: Icons.password,
                        obscureText: true,
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        validator: (value) {
                          if(confirmPassword == null || password != confirmPassword) {
                            return "Le due password non corrispondono";
                          }
                        }),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: () {
                      _formKey.currentState?.validate();
                    }, child: const Text("Registrati"))
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
