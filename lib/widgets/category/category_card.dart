import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/models/model_ex_category.dart';
import 'package:memoapp/screens/expanses_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.list,
  });

  final List<ExpanseCategory> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (_, i) => ListTile(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ExpanseScreen.routeName, arguments: list[i].title);
        },
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(list[i].iconData),
        ),
        title: Text(list[i].title),
        subtitle: Text("Entries : ${list[i].entries.toString()}"),
        trailing: Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
            .format(list[i].totalAmmount)),
      ),
      itemCount: list.length,
    );
  }
}
