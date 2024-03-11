import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:memoapp/widgets/expanses/expanses_chart.dart';
import 'package:memoapp/widgets/expanses/expanses_list.dart';
import 'package:provider/provider.dart';

class ExpansesFetcher extends StatefulWidget {
  final String category;
  const ExpansesFetcher({super.key, required this.category});

  @override
  State<StatefulWidget> createState() {
    return _ExpansesFetcherState();
  }
}

class _ExpansesFetcherState extends State<ExpansesFetcher> {
  late Future _expansesList;
  Future _getExpansesList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchExpanses(widget
        .category); // mengambil value dari class parent menggunakan widget
  }

  @override
  void initState() {
    super.initState();
    _expansesList = _getExpansesList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _expansesList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            if (int.tryParse(snapshot.data.length.toString()) == 0) {
              return const Center(
                child: Text("No Expanses Found!"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ExpansesChart(
                        category: widget.category,
                      ),
                    ),
                    const Expanded(
                      child: ExpansesList(),
                    ),
                  ],
                ),
              );
            }
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
