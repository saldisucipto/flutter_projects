import 'package:flutter/material.dart';
import 'package:memoapp/widgets/category/category_fetcher.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: const CategoryFetcher(),
    );
  }
}
