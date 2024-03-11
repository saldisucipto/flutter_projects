import 'package:flutter/material.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:memoapp/widgets/expanses/expanses_card.dart';
import 'package:provider/provider.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var exList = db.expanses;
        return ListView.builder(
          itemCount: exList.length,
          itemBuilder: (_, i) => ExpansesCard(exp: exList[i]),
        );
      },
    );
  }
}
