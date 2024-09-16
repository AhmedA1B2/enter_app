import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.inputType,
    this.onChanged,
    this.onSaved,
    required this.mycontroller,
     this.validator,
  });

  final String hintText;
  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      validator: validator,
      textAlign: TextAlign.end,
      //########## vars #######//
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      controller: mycontroller,

      decoration: InputDecoration(
        //########focuse########//
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: colorwhite)),
        // ####### Hint ####### //
        hintText: hintText,
        hintStyle: const TextStyle(
          color: bgColor,
          fontWeight: FontWeight.bold,
        ),
        // ######## body ####### //
        filled: true,
        fillColor: colorwhite,
        focusColor: colorwhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
              color: Colors.black, width: 2.0, style: BorderStyle.solid),
        ),
      ),
    );
  }
}
