import 'package:flutter/material.dart';

class CardPanel extends StatelessWidget {
  final String textCardTitle;
  final String? routeName;
  final Color? bgColor;

  const CardPanel(
      {super.key,
      required this.textCardTitle,
      required this.routeName,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.black12,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: const Center(
        child: Text("He'd have you all unravel at the"),
      ),
    );
  }
}
