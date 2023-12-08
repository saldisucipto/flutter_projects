import 'package:apps/Utils/database_helper.dart';
import 'package:apps/models/User.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExamplePageState();
  }
}

class ExamplePageState extends State<ExamplePage> {
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
        appBar: AppBar(
          leading: TextButton(
            onPressed: () async {
              await helper.batchInsert();
              setState(() {});
            },
            child: const Text("Add"),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await helper.deleteAllUsers();
                setState(() {});
              },
              child: const Text('Del'),
            ),
          ],
        ),
        body: FutureBuilder<List<User>>(
          future: helper.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No users found.'));
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return _card(user, context);
                },
              );
            }
          },
        ));
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
