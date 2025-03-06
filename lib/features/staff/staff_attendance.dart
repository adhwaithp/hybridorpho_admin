import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/theme/app_theme.dart';
import 'package:intl/intl.dart';

class Attendance extends StatefulWidget {
  const Attendance({
    super.key,
  });

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.solid, color: outlineColor),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 170,
                height: 40,
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      focusColor: Colors.blue,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.date_range)),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101));
                    if (picked != null) {
                      setState(() {
                        _textEditingController.text =
                            DateFormat('yyyy-MM-dd').format(picked).toString();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: DataTable2(
              columns: [
                DataColumn(label: Text("Staff Name")),
                DataColumn(label: Text("Type")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Check In")),
                DataColumn(label: Text("Check Out"))
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text("Jithin")),
                    DataCell(Text("Nurse")),
                    DataCell(Text("present")),
                    DataCell(Text("9:00 AM")),
                    DataCell(Text("5:00 PM"))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Jithin")),
                    DataCell(Text("Nurse")),
                    DataCell(Text("present")),
                    DataCell(Text("9:00 AM")),
                    DataCell(Text("5:00 PM")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
