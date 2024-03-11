import 'package:flutter/material.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:provider/provider.dart';

class ExpanseSearch extends StatefulWidget {
  const ExpanseSearch({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateExpanseSearch();
  }
}

class _StateExpanseSearch extends State<ExpanseSearch> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return TextField(
      onChanged: (value) {
        provider.searchText = value;
      },
      decoration: const InputDecoration(
        labelText: 'Seearch Expanse',
      ),
    );
  }
}
