import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Inventory",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "search for inventory",
                              label: Text("search")),
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    DropdownButton(
                        hint: Text("category"),
                        items: [
                          DropdownMenuItem(
                            child: Text("rice"),
                            value: "rice",
                          ),
                          DropdownMenuItem(
                            child: Text("daal"),
                            value: "daal",
                          ),
                          DropdownMenuItem(
                            child: Text("banana"),
                            value: "banana",
                          ),
                          DropdownMenuItem(
                            child: Text("water"),
                            value: "water",
                          )
                        ],
                        onChanged: (val) {}),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: RichText(
                  text: const TextSpan(children: [
                    WidgetSpan(child: Icon(Icons.add)),
                    TextSpan(text: "add Residents")
                  ]),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DataTable(
            columns: [
              DataColumn(
                label: Text(
                  "Stock Name",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text("category",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              DataColumn(
                label: Text("balance",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              DataColumn(
                label: Text("Aciton",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("Rice")),
                DataCell(Text("Rice")),
                DataCell(Text("Rice")),
                DataCell(Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                  ],
                ))
              ]),
              DataRow(cells: [
                DataCell(Text("Rice")),
                DataCell(Text("Rice")),
                DataCell(Text("Rice")),
                DataCell(Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                  ],
                ))
              ]),
            ],
            border: TableBorder.all(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
