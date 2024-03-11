import 'package:flutter/material.dart';
import 'package:memoapp/widgets/category/category_fetcher.dart';
import 'package:memoapp/widgets/expanse_form.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "category-screen";
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanse Category"),
      ),
      body: const CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const ExpanseForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
