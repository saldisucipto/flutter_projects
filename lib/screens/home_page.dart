import 'package:apps/Utils/database_helper.dart';
import 'package:apps/Utils/theme.dart';
import 'package:apps/models/User.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final DatabaseHelper helper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    helper.initWinDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Home"),
      ),
      drawer: Drawer(
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
                    'Atresna',
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
      ),
    );
  }
}

Widget _card(User user, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID: ${user.id}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Name: ${user.name}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Email: ${user.email}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Phone Number: ${user.phoneNumber}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Password: ${user.password}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
