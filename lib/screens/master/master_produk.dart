import 'package:apps/Utils/theme.dart';
import 'package:apps/screens/master_page.dart';
import 'package:flutter/material.dart';

class MasterProdukScreen extends StatefulWidget {
  static const String routeName = 'master-produk-screen';
  const MasterProdukScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _StateMasterProdukScreen();
  }
}

class _StateMasterProdukScreen extends State<MasterProdukScreen> {
  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    var sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          'Master Produk',
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
              width: sizeScreen.width,
              height: sizeScreen.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showFullModal(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bgColor2,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Add New Data',
                          style: TextStyle(
                            color: secondaryTextColor,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: secondaryTextColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
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

_showFullModal(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 350),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                      text:
                          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                          wordSpacing: 1)),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
