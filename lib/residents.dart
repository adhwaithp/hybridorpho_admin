import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Residents extends StatefulWidget {
  const Residents({super.key});

  @override
  State<Residents> createState() => _ResidentsState();
}

class _ResidentsState extends State<Residents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Residents",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Text("Manage resident information")
                  ]),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              child: SizedBox(
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Edit Residents",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.close),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 3,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      TextField(
                                        textCapitalization:
                                            TextCapitalization.words,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Age"),
                                      TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(
                                              "[0-9]",
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Blood group"),
                                      DropdownButton(
                                          hint: Text("A+"),
                                          isExpanded: true,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("A+"),
                                              value: "A+",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("A-"),
                                              value: "A-",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("B+"),
                                              value: "B+",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("B-"),
                                              value: "B-",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("AB+"),
                                              value: "AB+",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("AB-"),
                                              value: "AB-",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("O+"),
                                              value: "O+",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("O-"),
                                              value: "O-",
                                            )
                                          ],
                                          onChanged: (val) {}),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Gender"),
                                      DropdownButton(
                                          isExpanded: true,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Male"),
                                              value: "male",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("female"),
                                              value: "female",
                                            ),
                                          ],
                                          onChanged: (val) {}),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Medical condition"),
                                      TextField(),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .grey,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("cancel",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3))),
                                                onPressed: () {},
                                                child: Text(
                                                  "Save changes",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      backgroundColor: Colors.blue,
                      iconColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: RichText(
                    text: const TextSpan(children: [
                      WidgetSpan(child: Icon(Icons.add)),
                      TextSpan(text: "add Residents")
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 1000,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    DropdownButton(
                      value: 'all',
                      items: [
                        DropdownMenuItem(
                          value: 'all',
                          child: const Text("All gender"),
                        ),
                        const DropdownMenuItem(
                          value: 'male',
                          child: Text("Male"),
                        ),
                        DropdownMenuItem(
                          value: 'female',
                          child: Text("Female"),
                        ),
                      ],
                      onChanged: (val) {},
                    ),
                  ],
                ),
                Expanded(
                  child: DataTable(
                      dataRowMinHeight: 50,
                      dataRowMaxHeight: 60,
                      columns: [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Age")),
                        DataColumn(label: Text("Blood Group")),
                        DataColumn(label: Text("medical condition")),
                        DataColumn(label: Text("Action")),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Column(
                              children: [
                                Text("Ramesh",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text("ID:1001",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100))
                              ],
                            ),
                          ),
                          DataCell(Text("20")),
                          DataCell(Text("o+")),
                          DataCell(Text("heart disease")),
                          DataCell(Icon(Icons.edit)),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Column(
                              children: [
                                Text("Ramesh",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text("ID:1001",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100))
                              ],
                            ),
                          ),
                          DataCell(Text("20")),
                          DataCell(Text("o+")),
                          DataCell(Text("heart disease")),
                          DataCell(Icon(Icons.edit)),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Column(
                              children: [
                                Text("Ramesh",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text("ID:1001",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100))
                              ],
                            ),
                          ),
                          DataCell(Text("20")),
                          DataCell(Text("o+")),
                          DataCell(Text("heart disease")),
                          DataCell(Icon(Icons.edit)),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Column(
                              children: [
                                Text("Ramesh",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text("ID:1001",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100))
                              ],
                            ),
                          ),
                          DataCell(Text("20")),
                          DataCell(Text("o+")),
                          DataCell(Text("heart disease")),
                          DataCell(Icon(Icons.edit)),
                        ])
                      ]),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
