import 'package:apps/Utils/database_helper.dart';
import 'package:apps/Utils/theme.dart';
import 'package:apps/components/card_panel.dart';
import 'package:apps/screens/master_page.dart';
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
            return scaffoldKey.currentState!.openDrawer();
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
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            CardPanel(
              textCardTitle: "textCardTitle",
              routeName: null,
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
                    bottomRight: Radius.circular(20),
                  ),
                  color: bgColor2,
                ),
                margin: const EdgeInsets.only(right: 20),
                child: ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Master Page',
                        style: titleTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.difference_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(MasterPage.routeName);
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

// Widget _card(User user, BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "ID: ${user.id}",
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Name: ${user.name}",
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Email: ${user.email}",
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Phone Number: ${user.phoneNumber}",
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Password: ${user.password}",
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
