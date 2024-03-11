import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/constants/icons.dart';
import 'package:memoapp/models/model_expanse.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:provider/provider.dart';

class ExpanseForm extends StatefulWidget {
  const ExpanseForm({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpanseFormState();
  }
}

class _ExpanseFormState extends State<ExpanseForm> {
  final _title = TextEditingController();
  final _ammount = TextEditingController();
  DateTime? _date;
  String _initialValue = 'Other';

  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(labelText: 'Title of Expanse'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _ammount,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Ammount of Expanse'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_date != null
                      ? DateFormat("MMMM dd, yyyy").format(_date!)
                      : "Select Date"),
                ),
                IconButton(
                  onPressed: () {
                    _pickDate();
                  },
                  icon: const Icon(Icons.calendar_month),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            // category
            Row(
              children: [
                const Expanded(child: Text("Category")),
                Expanded(
                    child: DropdownButton(
                  items: icons.keys
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  value: _initialValue,
                  onChanged: (newValue) {
                    setState(() {
                      _initialValue = newValue!;
                    });
                  },
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_title.text != '' && _ammount.text != '') {
                  // create an expanse
                  final file = Expanse(
                    id: 0,
                    title: _title.text,
                    ammount: double.parse(_ammount.text),
                    date: _date != null ? _date! : DateTime.now(),
                    category: _initialValue,
                  );
                  // add it to database
                  provider.addExpanse(file);
                  // close the button
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Expanse'),
            ),
          ],
        ),
      ),
    );
  }
}
