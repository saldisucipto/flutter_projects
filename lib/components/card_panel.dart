import 'package:flutter/material.dart';

class CardPanel extends StatelessWidget {
  final String textCardTitle;
  final String? routeName;

  const CardPanel(
      {super.key, required this.textCardTitle, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName!);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text("He'd have you all unravel at the"),
        ),
      ),
    );
  }
}
