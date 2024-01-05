import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  static String routeName = 'master-page';
  const MasterPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _StateMasterPage();
  }
}

class _StateMasterPage<Master> extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Master Page'),
      ),
    );
  }
}
