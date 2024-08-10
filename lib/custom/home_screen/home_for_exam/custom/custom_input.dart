import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class CustomInputQ extends StatelessWidget {
  const CustomInputQ({
    super.key,
    required this.hintText,
    this.inputType,
    this.onChanged,
    this.onSaved, required this.mycontroller,
  });

  final String hintText;
  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  
  final TextEditingController mycontroller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: SizeConfig.screenWidth! * 0.3,
        child: TextFormField(
          controller: mycontroller,
          style: const TextStyle(color: colorwhite),
          textAlign: TextAlign.end,
          //########## vars #######//
          keyboardType: inputType,
          onChanged: onChanged,
          onSaved: onSaved,

          decoration: InputDecoration(
            //########focuse########//
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: bgColor,
            )),
            // ####### Hint ####### //
            hintText: hintText,
            hintStyle: const TextStyle(
              color: colorwhite,
              fontWeight: FontWeight.bold,
            ),
            // ######## body ####### //
            filled: true,
            fillColor: bgColor,
            focusColor: colorwhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: colorwhite,
                width: 2.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
