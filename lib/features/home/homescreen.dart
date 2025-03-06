import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/features/gallery/gallery_screen.dart';
import 'package:hybridorpho_admin/inventory.dart';
import 'package:hybridorpho_admin/features/residents/residents.dart';
import 'package:hybridorpho_admin/features/staff/staff.dart';
import 'package:hybridorpho_admin/theme/app_theme.dart';
import 'package:hybridorpho_admin/volunter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    _tabController = TabController(vsync: this, length: 6, initialIndex: 2);
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
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white),
                  ),
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
                  leading: const Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: Text(
                    "residents",
                    style: TextStyle(color: Colors.white),
                  ),
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
                  leading: const Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: Text(
                    "staff",
                    style: TextStyle(color: Colors.white),
                  ),
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
              // ElevatedButton(
              //   child: const ListTile(
              //     leading: const Icon(Icons.schedule),
              //     title: Text("schedule"),
              //   ),
              //   onPressed: () {
              //     _tabController.animateTo(3);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     side: BorderSide(width: 0, color: Colors.blue),
              //     elevation: 0,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(0)),
              //     backgroundColor:
              //         _tabController.index == 3 ? Colors.red : Colors.blue,
              //   ),
              // ),
              // ElevatedButton(
              //   child: const ListTile(
              //     leading: const Icon(Icons.local_activity),
              //     title: Text("activity"),
              //   ),
              //   onPressed: () {
              //     _tabController.animateTo(4);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     side: BorderSide(width: 0, color: Colors.blue),
              //     elevation: 0,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(0)),
              //     backgroundColor:
              //         _tabController.index == 4 ? Colors.red : Colors.blue,
              //   ),
              // ),
              ElevatedButton(
                child: const ListTile(
                  leading: const Icon(
                    Icons.inventory,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Inventory",
                    style: TextStyle(color: Colors.white),
                  ),
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
                  leading: const Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Volunteer management",
                    style: TextStyle(color: Colors.white),
                  ),
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
                  leading: const Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  _tabController.animateTo(5);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.blue),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
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
            Dashboard(),
            Residents(),
            Staff(),
            Inventory(),
            Volunter(),
            GalleryScreen(),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          spacing: 20,
          children: [
            FutureBuilder(
              future: Supabase.instance.client
                  .from('senior_citizen')
                  .select()
                  .count(),
              builder: (context, snapshot) {
                int? count = snapshot.data?.count ?? 0;
                return CustomNavBar(title: 'Residents', value: '$count');
              },
            ),
            FutureBuilder(
              future:
                  Supabase.instance.client.from('gallerys').select().count(),
              builder: (context, snapshot) {
                int? count = snapshot.data?.count ?? 0;
                return CustomNavBar(title: 'Gallerys', value: '$count');
              },
            ),
            FutureBuilder(
              future: Supabase.instance.client.from('staffs').select().count(),
              builder: (context, snapshot) {
                int? count = snapshot.data?.count ?? 0;
                return CustomNavBar(title: 'staffs', value: '$count');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final String title;
  final String value;
  const CustomNavBar({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        height: 100,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(title),
                Text(
                  value,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
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
    );
  }
}
