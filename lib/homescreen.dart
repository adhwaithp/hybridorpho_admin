import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/inventory.dart';
import 'package:hybridorpho_admin/main.dart';
import 'package:hybridorpho_admin/residents.dart';
import 'package:hybridorpho_admin/staff.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 6);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          backgroundColor: Colors.blue,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "hybridorpho",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.home),
                  title: Text("Dashboard"),
                ),
                onPressed: () {
                  _tabController.animateTo(0);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor:
                      _tabController.index == 0 ? Colors.red : Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.people),
                  title: Text("residents"),
                ),
                onPressed: () {
                  _tabController.animateTo(1);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor:
                      _tabController.index == 1 ? Colors.red : Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.people),
                  title: Text("staff"),
                ),
                onPressed: () {
                  _tabController.animateTo(2);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor:
                      _tabController.index == 2 ? Colors.red : Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.schedule),
                  title: Text("schedule"),
                ),
                onPressed: () {
                  _tabController.animateTo(3);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor:
                      _tabController.index == 3 ? Colors.red : Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.local_activity),
                  title: Text("activity"),
                ),
                onPressed: () {
                  _tabController.animateTo(4);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor:
                      _tabController.index == 4 ? Colors.red : Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.inventory),
                  title: Text("Inventory"),
                ),
                onPressed: () {
                  _tabController.animateTo(5);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor:
                      _tabController.index == 5 ? Colors.red : Colors.blue,
                ),
              ),
            ],
          )),
      body: Expanded(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                ),
                Text(
                  "welcome back administator",
                  style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 5),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("residents"),
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.people,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("residents"),
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.people,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("residents"),
                                Text("10",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 34)),
                              ],
                            ),
                            Icon(
                              Icons.people,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                        height: 100,
                        margin: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("residents"),
                                Text("10",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 34)),
                              ],
                            ),
                            Icon(
                              Icons.people,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "up coming events",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "dewali celebration",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text("festival")
                                      ],
                                    ),
                                    Text("2024-10-3")
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "dewali celebration",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text("festival")
                                      ],
                                    ),
                                    Text("2024-10-3")
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "dewali celebration",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text("festival")
                                      ],
                                    ),
                                    Text("2024-10-3")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        height: 350,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Todays activity",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      children: [
                                        Text(
                                          "dewali celebration",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text("festival")
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: const Text(
                                        "8 participants",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      children: [
                                        Text(
                                          "dewali celebration",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text("festival")
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: const Text(
                                        "8 participants",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      children: [
                                        Text(
                                          "dewali celebration",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text("festival")
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: const Text(
                                        "8 participants",
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Residents(),
            Staff(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
            Inventory()
          ],
        ),
      ),
    );
  }
}
