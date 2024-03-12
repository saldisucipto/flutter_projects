import 'package:apps/Utils/theme.dart';
import 'package:flutter/material.dart';

class CardPanel extends StatelessWidget {
  final String textCardTitle;
  final String? routeName;
  final Color? bgColor;
  final IconData? iconCard;

  const CardPanel({
    super.key,
    required this.textCardTitle,
    required this.routeName,
    required this.bgColor,
    required this.iconCard,
  });

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
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routeName!);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              // ignore: unnecessary_null_comparison
              iconCard ?? Icons.apps,
              color: secondaryTextColor,
              size: 50,
            ),
            Text(
              textCardTitle.toString(),
              style: const TextStyle(
                color: secondaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
