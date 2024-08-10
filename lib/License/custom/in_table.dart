import 'package:flutter/material.dart';

class InTable extends StatelessWidget {
  const InTable({super.key, required this.inTable});
  final String inTable;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(inTable),
      ),
    );
  }
}
