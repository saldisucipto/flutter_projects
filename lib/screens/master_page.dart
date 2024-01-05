import 'package:apps/components/my_drawer.dart';
import 'package:apps/components/my_header.dart';
import 'package:apps/services/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MasterPage extends ConsumerStatefulWidget {
  static String routeName = 'master-page';
  const MasterPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StateMasterPage();
}

class _StateMasterPage extends ConsumerState<MasterPage> {
  @override
  Widget build(BuildContext context) {
    var key = ref.watch(scaffoldKey);

    return Scaffold(
      appBar: myHeader(scaffoldKey: key, context: context),
      body: Center(
        child: Text('Master Page'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
