import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/homescreen.dart';
import 'package:hybridorpho_admin/main.dart';
import 'package:hybridorpho_admin/residents.dart';

class Staff extends StatelessWidget {
  const Staff({super.key});

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
                  title: Text("Home"),
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
    );
  }
}
