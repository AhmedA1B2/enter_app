import 'package:flutter/material.dart';

class TextTable extends StatelessWidget {
  const TextTable({super.key, required this.dataa});
  final String dataa;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        dataa,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
