import 'package:flutter/material.dart';
import 'package:memoapp/widgets/all_expanses/all_expanses_fetcher.dart';

class AllExpansesScreen extends StatefulWidget {
  const AllExpansesScreen({super.key});
  static const String routeName = 'all-expanses-fetcher-screen';

  @override
  State<StatefulWidget> createState() {
    return _StateAllExpanse();
  }
}

class _StateAllExpanse extends State<AllExpansesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Expanse'),
      ),
      body: const AllExpansesFetcher(),
    );
  }
}
