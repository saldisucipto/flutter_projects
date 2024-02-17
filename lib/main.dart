import 'package:apps/screens/home_page.dart';
import 'package:apps/screens/master/master_user.dart';
import 'package:apps/screens/master_page.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1024, 768);
    win.minSize = initialSize;
    win.maxSize = const Size(1280, 720);
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "My Apps";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (contex) => const HomePage(),
          MasterPage.routeName: (context) => const MasterPage(),
          MasterUser.routeName: (context) => const MasterUser(),
        });
  }
}
