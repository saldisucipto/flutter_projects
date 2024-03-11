import 'package:flutter/material.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:memoapp/widgets/all_expanses/all_expanses_list.dart';
import 'package:memoapp/widgets/all_expanses/all_expanses_search.dart';
import 'package:provider/provider.dart';

class AllExpansesFetcher extends StatefulWidget {
  const AllExpansesFetcher({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateAllExpansesFetcher();
  }
}

class _StateAllExpansesFetcher extends State<AllExpansesFetcher> {
  late Future _allExpansesList;

  Future _getAllExpanses() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllExpanses();
  }

  @override
  void initState() {
    super.initState();
    _allExpansesList = _getAllExpanses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allExpansesList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ExpanseSearch(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: AllExpansesList()),
                ],
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
