import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  static String routeName = 'master-page';
  const MasterPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _StateMasterPage();
  }
}

class _StateMasterPage extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Center(child: Text('Just Master Page')),
    );
  }
}
