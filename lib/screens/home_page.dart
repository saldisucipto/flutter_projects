import 'package:apps/Utils/database_helper.dart';
import 'package:apps/Utils/theme.dart';
import 'package:apps/components/card_panel.dart';
import 'package:apps/screens/master_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final DatabaseHelper helper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    helper.initWinDB();
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          'Atresna Dashboard',
          style: titleTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        backgroundColor: bgColor2,
        leading: IconButton(
          icon: const Icon(
            Icons.dashboard_outlined,
            color: secondaryTextColor,
          ),
          onPressed: () {
            key.currentState!.openDrawer();
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  'Saldi Sucipto',
                  style: titleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
                            iconCard: null,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
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
                    iconCard: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: bgColor1,
        child: ListView(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: bgColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.dashboard,
                        color: secondaryTextColor,
                      )),
                  Text(
                    'Dashboard',
                    style: titleTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  color: bgColor2,
                ),
                margin: const EdgeInsets.only(right: 20),
                child: ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.settings_input_composite_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Master Data',
                        style: menuTextStyle,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.of(context).pushNamed(MasterPage.routeName);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                  color: bgColor2,
                ),
                margin: const EdgeInsets.only(right: 20),
                child: ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
