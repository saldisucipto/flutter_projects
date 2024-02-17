import 'package:flutter/material.dart';

class MasterUser extends StatefulWidget {
  static String routeName = 'master-page-user';
  const MasterUser({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateMasterUser();
  }
}

class _StateMasterUser extends State<MasterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text("Master User Page"),
      ),
    );
  }
}
