import 'package:flutter/material.dart';

class TitleTable extends StatelessWidget {
  const TitleTable({super.key, required this.titleTable});

  final String titleTable;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titleTable,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
