import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/constants/icons.dart';
import 'package:memoapp/models/model_expanse.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:provider/provider.dart';

class ExpansesCard extends StatelessWidget {
  const ExpansesCard({super.key, required this.exp});

  final Expanse exp;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Delete ${exp.title} ?"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Don\'t Delete')),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    provider.deletExpanse(exp.id, exp.category, exp.ammount);
                  },
                  child: const Text('Delete '),
                ),
              ],
            ),
          ),
        );
        return null;
      },
      child: ListTile(
        leading: Icon(icons[exp.category]),
        title: Text(exp.title),
        subtitle: Text(DateFormat('MMMM dd, yyyy').format(exp.date)),
        trailing: Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
            .format(exp.ammount)),
      ),
    );
  }
}
