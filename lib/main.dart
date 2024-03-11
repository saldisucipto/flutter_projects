import 'package:flutter/material.dart';
import 'package:memoapp/screens/all_expasnes_screen.dart';
import 'package:memoapp/screens/category_screen.dart';
import 'package:memoapp/screens/expanses_screen.dart';
import 'package:memoapp/screens/home_screen.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:provider/provider.dart';

// fungsi utama
void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DatabaseProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        CategoryScreen.routeName: (_) => const CategoryScreen(),
        ExpanseScreen.routeName: (_) => const ExpanseScreen(),
        AllExpansesScreen.routeName: (_) => const AllExpansesScreen(),
      },
    );
  }
}
