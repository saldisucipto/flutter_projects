import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/constants/icons.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:provider/provider.dart';

class AllExpansesList extends StatelessWidget {
  const AllExpansesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.expanses;
      return ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (_, i) => ListTile(
          leading: Icon(icons[list[i].category]),
          title: Text(list[i].title),
          subtitle: Text(DateFormat('MMMM dd, yyyy').format(list[i].date)),
          trailing: Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
              .format(list[i].ammount)),
        ),
        itemCount: list.length,
      );
    });
  }
}
