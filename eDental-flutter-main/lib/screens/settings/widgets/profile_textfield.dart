import 'package:flutter/material.dart';

class ProfileTextfield extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool isPasswordTextfield;
  final TextEditingController controller;
  final bool validate;
  final String? Function(String?)? validator;
  ProfileTextfield(
      {required this.label,
      required this.placeholder,
      required this.isPasswordTextfield,
      required this.controller,
      required this.validate,
      this.validator});

  @override
  State<ProfileTextfield> createState() => _ProfileTextfieldState();
}

class _ProfileTextfieldState extends State<ProfileTextfield> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPasswordTextfield ? showPassword : false,
        decoration: InputDecoration(
          errorText: widget.validate ? "Value Can't Be Empty" : null,
          suffixIcon: widget.isPasswordTextfield
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
              : null,
          label: Text(
            widget.label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          contentPadding: const EdgeInsets.only(bottom: 3.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(
              fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
