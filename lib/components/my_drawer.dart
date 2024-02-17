import 'package:apps/Utils/theme.dart';
import 'package:apps/screens/master_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor1,
      child: ListView(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          Container(
            height: 70,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: bgColor2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.dashboard,
                      color: secondaryTextColor,
                    )),
                Text(
                  'Dashboard',
                  style: titleTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
                color: bgColor2,
              ),
              margin: const EdgeInsets.only(right: 20),
              child: ListTile(
                title: Row(
                  children: [
                    const Icon(
                      Icons.settings_input_composite_sharp,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Master Data',
                      style: menuTextStyle,
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.of(context).pushNamed(MasterPage.routeName);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                ),
                color: bgColor2,
              ),
              margin: const EdgeInsets.only(right: 20),
              child: ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
