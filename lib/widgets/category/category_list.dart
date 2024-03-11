import 'package:flutter/material.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:memoapp/widgets/category/category_card.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.category;
      return CategoryCard(list: list);
    });
  }
}
