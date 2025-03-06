import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/theme/app_theme.dart';
import 'staff_attendance.dart';
import 'staff_details_section.dart';
import 'staff_leave_application.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                child: Text(
                  "Staffs",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              CustomStaffBarButton(
                isActive: _tabController2.index == 0,
                name: "Staff Details",
                iconData: Icons.people,
                onTap: () {
                  _tabController2.animateTo(0);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CustomStaffBarButton(
                isActive: _tabController2.index == 1,
                name: "Leave Application",
                iconData: Icons.people,
                onTap: () {
                  _tabController2.animateTo(1);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CustomStaffBarButton(
                isActive: _tabController2.index == 2,
                name: "Attendance",
                iconData: Icons.people,
                onTap: () {
                  _tabController2.animateTo(2);
                },
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController2,
              children: const [
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

class CustomStaffBarButton extends StatelessWidget {
  final bool isActive;
  final String name;
  final IconData iconData;
  final Function() onTap;
  const CustomStaffBarButton({
    super.key,
    this.isActive = false,
    required this.name,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? primaryColor : secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: isActive
            ? BorderSide.none
            : const BorderSide(color: outlineColor, width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: isActive ? Colors.white : primaryColor)),
              SizedBox(
                width: 10,
              ),
              Icon(
                iconData,
                color: isActive ? Colors.white : primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
