import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class LeaveApplication extends StatelessWidget {
  const LeaveApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.solid, color: outlineColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: Text(
                      "New leave application",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          ),
          DataTable2(columns: [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Type")),
            DataColumn(label: Text("Start Date")),
            DataColumn(label: Text("End Date")),
            DataColumn(label: Text("Reason")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Action"))
          ], rows: [
            DataRow(cells: [
              DataCell(Text("Ramesh")),
              DataCell(Text("nurse")),
              DataCell(Text("22-10-2024")),
              DataCell(Text("22-10-2024")),
              DataCell(Text("fever")),
              DataCell(Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(child: Icon(Icons.pending_actions_sharp)),
                    TextSpan(text: "pending"),
                  ]),
                ),
              )),
              DataCell(Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.verified,
                        color: Colors.green,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ))
                ],
              ))
            ]),
            DataRow(cells: [
              DataCell(Text("Ramesh")),
              DataCell(Text("nurse")),
              DataCell(Text("22-10-2024")),
              DataCell(Text("22-10-2024")),
              DataCell(Text("fever")),
              DataCell(Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(child: Icon(Icons.check)),
                    TextSpan(text: "Approved"),
                  ]),
                ),
              )),
              DataCell(Text(""))
            ]),
          ])
        ],
      ),
    );
  }
}
