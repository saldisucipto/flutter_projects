import 'package:apps/Utils/database_helper.dart';
import 'package:apps/components/card_panel.dart';
import 'package:apps/components/my_drawer.dart';
import 'package:apps/components/my_header.dart';
import 'package:apps/models/User.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final DatabaseHelper helper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    helper.initWinDB();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: myHeader(scaffoldKey: scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CardPanel(
                            textCardTitle: "textCardTitle",
                            routeName: null,
                            bgColor: null,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CardPanel(
                            textCardTitle: "textCardTitle",
                            routeName: null,
                            bgColor: null,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CardPanel(
                            textCardTitle: "textCardTitle",
                            routeName: null,
                            bgColor: null,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CardPanel(
                            textCardTitle: "textCardTitle",
                            routeName: null,
                            bgColor: null,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.35,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  CardPanel(
                    textCardTitle: "textCardTitle",
                    routeName: null,
                    bgColor: Colors.white,
                  ),
                  CardPanel(
                    textCardTitle: "textCardTitle",
                    routeName: null,
                    bgColor: Colors.white,
                  ),
                  CardPanel(
                    textCardTitle: "textCardTitle",
                    routeName: null,
                    bgColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

Widget _card(User user, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID: ${user.id}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Name: ${user.name}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Email: ${user.email}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Phone Number: ${user.phoneNumber}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Password: ${user.password}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
