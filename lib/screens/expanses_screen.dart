import 'package:flutter/material.dart';
import 'package:memoapp/widgets/expanses/expanses_fetcher.dart';

class ExpanseScreen extends StatelessWidget {
  static const String routeName = 'expanses-screen';
  const ExpanseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get the argument passed
    final category = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ExpansesFetcher(
        category: category,
      ),
    );
  }
}
