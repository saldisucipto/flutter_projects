import 'package:apps/Utils/theme.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget myHeader({required GlobalKey<ScaffoldState> scaffoldKey}) {
  // final GlobalKey<ScaffoldState> scaffoldKey;
  return AppBar(
    title: Text(
      'Atresna Dashboard',
      style: titleTextStyle.copyWith(fontWeight: FontWeight.w600),
    ),
    backgroundColor: bgColor2,
    leading: IconButton(
      icon: const Icon(
        Icons.dashboard_outlined,
        color: secondaryTextColor,
      ),
      onPressed: () {
        return scaffoldKey.currentState!.openDrawer();
      },
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Text(
              'Saldi Sucipto',
              style: titleTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
