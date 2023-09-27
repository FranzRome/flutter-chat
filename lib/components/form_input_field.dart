import 'package:flutter/material.dart';

class FormInputField extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final bool obscureText;

  const FormInputField({
    required this.hintText,
    required this.iconData,
    this.validator,
    required this.onChanged,
    this.obscureText = false,
    super.key});

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: widget.obscureText && !showText,
          validator: widget.validator,
          cursorColor: Colors.white,
          keyboardType: TextInputType.emailAddress,
          onChanged: widget.onChanged,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.obscureText ? IconButton(
              onPressed: () {
                setState(() {
                  showText = !showText;
                });
              },
              icon: Icon(
                showText ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              )
            ) : null,
            icon: Icon(
              widget.iconData,
              color: Colors.black87,
            ),
            filled: true,
            fillColor: Colors.black87,
            hintStyle: const TextStyle(
              color: Colors.white70,
            ),
            floatingLabelStyle: const TextStyle(
              color: Colors.black87,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: widget.hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
            ),
          )),
    );
  }
}
