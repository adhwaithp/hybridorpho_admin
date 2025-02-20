import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> with SingleTickerProviderStateMixin {
  late TabController _tabController2;

  @override
  void initState() {
    _tabController2 = TabController(length: 3, vsync: this);
    _tabController2.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Residents",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 25),
          Row(children: [
            SizedBox(
                width: 170,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _tabController2.index == 0
                            ? Colors.blue
                            : Colors.amber,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      _tabController2.animateTo(0);
                    },
                    child: Row(
                      children: [
                        Text("Staff Details"),
                        Icon(
                          Icons.people,
                          color: _tabController2.index == 0
                              ? Colors.amber
                              : Colors.blue,
                        )
                      ],
                    ))),
            SizedBox(
              width: 20,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _tabController2.index == 1
                            ? Colors.blue
                            : Colors.amber,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      _tabController2.animateTo(1);
                    },
                    child: Row(
                      children: [
                        Text("Leave Application"),
                        Icon(
                          Icons.people,
                          color: _tabController2.index == 1
                              ? Colors.amber
                              : Colors.blue,
                        )
                      ],
                    ))),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 170,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _tabController2.index == 2 ? Colors.blue : Colors.amber,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () {
                  _tabController2.animateTo(2);
                },
                child: Row(
                  children: [
                    Text("Staff Details"),
                    Icon(
                      Icons.people,
                      color: _tabController2.index == 2
                          ? Colors.amber
                          : Colors.blue,
                    )
                  ],
                ),
              ),
            ),
          ]),
          Expanded(
            child: TabBarView(
              controller: _tabController2,
              children: [
                StaffDetailsSection(),
                LeaveApplication(),
                Attendance()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Attendance extends StatefulWidget {
  const Attendance({
    super.key,
  });

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  TextEditingController _textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          _textEditingController.text = DateFormat('yyyy-MM-dd')
                              .format(picked)
                              .toString();
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
            DataTable(columns: [
              DataColumn(label: Text("Staff Name")),
              DataColumn(label: Text("Type")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("Check In")),
              DataColumn(label: Text("Check Out"))
            ], rows: [
              DataRow(cells: [
                DataCell(Text("Jithin")),
                DataCell(Text("Nurse")),
                DataCell(Text("present")),
                DataCell(Text("9:00 AM")),
                DataCell(Text("5:00 PM"))
              ]),
              DataRow(cells: [
                DataCell(Text("Jithin")),
                DataCell(Text("Nurse")),
                DataCell(Text("present")),
                DataCell(Text("9:00 AM")),
                DataCell(Text("5:00 PM"))
              ])
            ])
          ],
        ));
  }
}

class LeaveApplication extends StatelessWidget {
  const LeaveApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
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
          DataTable(columns: [
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

class StaffDetailsSection extends StatelessWidget {
  const StaffDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration:
              BoxDecoration(border: Border.all(style: BorderStyle.solid)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((context) => AddStaff()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.add),
                            Text(
                              "add staff",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              DataTable(columns: [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Age")),
                DataColumn(label: Text("Type")),
                DataColumn(label: Text("Phone")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("Action")),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text("Ramesh")),
                  DataCell(Text("22")),
                  DataCell(Text("cook")),
                  DataCell(Text("983234678")),
                  DataCell(Text("jithin @gmail.com")),
                  DataCell(Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ))
                ]),
                DataRow(cells: [
                  DataCell(Text("Jithin")),
                  DataCell(Text("28")),
                  DataCell(Text("Nurse")),
                  DataCell(Text("983234678")),
                  DataCell(Text("jithin @gmail.com")),
                  DataCell(Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ))
                ])
              ])
            ],
          ),
        ),
      ],
    );
  }
}

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'Male';
  String _type = "Cook";
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Edit volunteers",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'null';
                    } else if (value.trim().isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Age"),
                TextFormField(
                  controller: _ageController,
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
                Text("Phone"),
                TextFormField(
                  controller: _phoneController,
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
                Text("Gender"),
                DropdownButton(
                    isExpanded: true,
                    value: _gender,
                    items: [
                      DropdownMenuItem(
                        child: Text("Male"),
                        value: "Male",
                      ),
                      DropdownMenuItem(
                        child: Text("female"),
                        value: "Female",
                      ),
                    ],
                    onChanged: (val) {
                      _gender = val!;
                      setState(() {});
                    }),
                SizedBox(
                  height: 10,
                ),
                Text("Type"),
                DropdownButton(
                    isExpanded: true,
                    value: _type,
                    items: [
                      DropdownMenuItem(
                        child: Text("Cook"),
                        value: "Cook",
                      ),
                      DropdownMenuItem(
                        child: Text("Nurse"),
                        value: "Nurse",
                      ),
                    ],
                    onChanged: (val) {
                      _gender = val!;
                      setState(() {});
                    }),
                SizedBox(
                  height: 10,
                ),
                Text("Email"),
                TextFormField(
                  controller: _emailController,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          onPressed: () {},
                          child: Text(
                            "Save changes",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
