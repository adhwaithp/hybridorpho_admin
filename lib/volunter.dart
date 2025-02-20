import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common widgets/add_edit.dart';

class Volunter extends StatefulWidget {
  const Volunter({super.key});

  @override
  State<Volunter> createState() => _VolunterState();
}

class _VolunterState extends State<Volunter>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
      super.initState();
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Volunteer Management",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                  width: 180,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _tabController.index == 0
                              ? Colors.blue
                              : Colors.amber,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () {
                        _tabController.animateTo(0);
                      },
                      child: Row(
                        children: [
                          Text("volunteer Details"),
                          Icon(
                            Icons.people,
                            color: _tabController.index == 0
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
                          backgroundColor: _tabController.index == 1
                              ? Colors.blue
                              : Colors.amber,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () {
                        _tabController.animateTo(1);
                      },
                      child: Row(
                        children: [
                          Text("Staff Details"),
                          Icon(
                            Icons.people,
                            color: _tabController.index == 1
                                ? Colors.amber
                                : Colors.blue,
                          )
                        ],
                      ))),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [Tasks(), VolunteerDetail()],
            ),
          )
        ],
      ),
    );
  }
}

class VolunteerDetail extends StatelessWidget {
  const VolunteerDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                              builder: (context) => AddEditVolunteerDialog(),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.add),
                              Text(
                                "Add volunteer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    VolunteerDetailsCard(
                        name: "vimla",
                        age: "44",
                        email: "rahul@gmail.com",
                        phone: "5687899",
                        skills: "driving",
                        availability: "weekend",
                        joinDate: "09-03-2004",
                        onEdit: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddEditVolunteerDialog());
                        }),
                    VolunteerDetailsCard(
                      name: "emma",
                      age: "28",
                      email: "rahul@gmail.com",
                      phone: "5687899",
                      skills: "driving",
                      availability: "weekend",
                      joinDate: "09-03-2004",
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) => AddEditVolunteerDialog(
                                  volunteerDetail: {'name': 'emma'},
                                ));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VolunteerDetailsCard extends StatelessWidget {
  final String name, age, joinDate, phone, email, availability, skills;

  final Function() onEdit;
  const VolunteerDetailsCard({
    super.key,
    required this.name,
    required this.onEdit,
    required this.age,
    required this.joinDate,
    required this.phone,
    required this.email,
    required this.availability,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(2, 2),
              color: const Color.fromARGB(255, 233, 232, 232))
        ],
        borderRadius: BorderRadius.circular(7),
      ),
      width: 400,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    joinDate,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("age:" + age, style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("phone:" + phone, style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Email:" + email, style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Availability:" + availability,
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('skills:'),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(5),
                        child: Text("Elder care"),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 138, 162, 201),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(5),
                        child: Text("First Aid"),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 138, 162, 201),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(5),
                        child: Text("Event Planning"),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 138, 162, 201),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Tasks extends StatelessWidget {
  const Tasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      constraints:
          BoxConstraints(maxHeight: 800, minHeight: 400, minWidth: 800),
      color: Color.fromRGBO(242, 243, 245, 1),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assign Tasks",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.add),
                        Text(
                          "Assign new task",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset(2, 2),
                    color: Color.fromRGBO(95, 95, 95, 0.5))
              ],
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "morning exercise session",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "high priority",
                        style: TextStyle(backgroundColor: Colors.red),
                      ),
                    )
                  ],
                ),
                Text(
                  "lead a gentle exercise session for residents",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(child: Icon(Icons.date_range)),
                      TextSpan(text: "2024-03-09")
                    ])),
                    Container(
                      margin: EdgeInsets.all(5),
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
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    color: Color.fromRGBO(95, 95, 95, 0.5))
              ],
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "morning exercise session",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "high priority",
                        style: TextStyle(backgroundColor: Colors.red),
                      ),
                    )
                  ],
                ),
                Text(
                  "lead a gentle exercise session for residents",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(child: Icon(Icons.date_range)),
                      TextSpan(text: "2024-03-09")
                    ])),
                    Container(
                      margin: EdgeInsets.all(5),
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
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
