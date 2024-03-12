import 'package:apps/Utils/theme.dart';
import 'package:apps/components/card_panel.dart';
import 'package:apps/screens/master/master_produk.dart';
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
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          'Master Pages',
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 6,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: const [
              CardPanel(
                textCardTitle: "Master Produk",
                routeName: MasterProdukScreen.routeName,
                bgColor: bgColor2,
                iconCard: Icons.warehouse,
              ),
            ],
          ),
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
                        Navigator.of(context).pushReplacementNamed('/');
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
