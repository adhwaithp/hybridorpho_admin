import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/main.dart';
import 'package:hybridorpho_admin/residents.dart';
import 'package:hybridorpho_admin/staff.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homescreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.people),
                  title: Text("residents"),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Residents(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.people),
                  title: Text("staff"),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Staff(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.schedule),
                  title: Text("schedule"),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.local_activity),
                  title: Text("activity"),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text("settings"),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          )),
      body: Column(
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("residents"),
                          Text(
                            "10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 34),
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
                                fontWeight: FontWeight.bold, fontSize: 34),
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
                                  fontWeight: FontWeight.bold, fontSize: 34)),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("residents"),
                          Text("10",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 34)),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                                      color: Colors.black.withOpacity(0.4)))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: Colors.black.withOpacity(0.4)))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: Colors.black.withOpacity(0.4)))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink,
                  ),
                  child: Container(
                    padding:const EdgeInsets.all(20),
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
                                      color: Colors.black.withOpacity(0.4)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    borderRadius: BorderRadius.circular(10)),
                                padding:const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child:const Text(
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
                                      color: Colors.black.withOpacity(0.4)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    borderRadius: BorderRadius.circular(10)),
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
                                      color: Colors.black.withOpacity(0.4)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
