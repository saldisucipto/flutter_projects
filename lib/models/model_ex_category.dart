import 'package:flutter/material.dart';
import 'package:memoapp/constants/icons.dart';

class ExpanseCategory {
  final String title; // title category expanse
  int entries =
      0; // home many expanses are in this category. it will change oevrtime
  double totalAmmount = 0.0; // total ammount of expanse in category
  final IconData iconData; // we will define beberapa constant icon

// constructor model
  ExpanseCategory({
    required this.title,
    required this.entries,
    required this.totalAmmount,
    required this.iconData,
  });

  // method to convert this model to map
  // so that we can insert it into a database
  Map<String, dynamic> toMap() => {
        "title": title,
        "entries": entries,
        "totalAmmount": totalAmmount
            .toString(), //our database wont be able to store double value so we convert it to a string
        // not gonna store the icon in database, thats to much works
      };

  // when we retire the data from database it will be a 'Map'
  // for our app to undertand the data, wee need to convert it back to a 'Expanse Category'
  factory ExpanseCategory.fromString(Map<String, dynamic> value) =>
      ExpanseCategory(
        title: value['title'],
        entries: value["entries"],
        totalAmmount: double.parse(value["totalAmmount"]),
        iconData: icons[value['title']]!,
      );
}
