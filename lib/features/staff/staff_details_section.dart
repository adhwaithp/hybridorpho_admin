import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybridorpho_admin/common_widget/custom_button.dart';
import 'package:hybridorpho_admin/common_widget/custom_search.dart';
import 'package:hybridorpho_admin/theme/app_theme.dart';
import 'package:hybridorpho_admin/util/format_function.dart';
import 'package:logger/web.dart';

import '../../common_widget/custom_alert_dialog.dart';
import '../../util/check_login.dart';
import 'add_staff.dart';
import 'staff_bloc/staffs_bloc.dart';

class StaffDetailsSection extends StatefulWidget {
  const StaffDetailsSection({
    super.key,
  });

  @override
  State<StaffDetailsSection> createState() => _StaffDetailsSectionState();
}

class _StaffDetailsSectionState extends State<StaffDetailsSection> {
  final StaffsBloc _staffsBloc = StaffsBloc();

  Map<String, dynamic> params = {
    'query': null,
  };

  List<Map> _staffs = [];

  @override
  void initState() {
    checkLogin(context);
    getStaffs();
    super.initState();
  }

  void getStaffs() {
    _staffsBloc.add(GetAllStaffsEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _staffsBloc,
      child: BlocConsumer<StaffsBloc, StaffsState>(
        listener: (context, state) {
          if (state is StaffsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getStaffs();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is StaffsGetSuccessState) {
            _staffs = state.staffs;
            Logger().w(_staffs);
            setState(() {});
          } else if (state is StaffsSuccessState) {
            getStaffs();
          }
        },
        builder: (context, state) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: outlineColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 400,
                          child: CustomSearch(
                            onSearch: (search) {
                              params['query'] = search;
                              getStaffs();
                            },
                          ),
                        ),
                        CustomButton(
                          label: 'Add Staff',
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((context) => BlocProvider.value(
                                      value: _staffsBloc,
                                      child: AddStaff(),
                                    )));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is StaffsLoadingState) LinearProgressIndicator(),
                    if (state is StaffsGetSuccessState && _staffs.isEmpty)
                      Center(
                        child: Text("No Staff found!"),
                      ),
                    if (state is StaffsGetSuccessState && _staffs.isNotEmpty)
                      Expanded(
                        child: DataTable2(
                          columns: [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("Age")),
                            DataColumn(label: Text("Type")),
                            DataColumn(label: Text("Phone")),
                            DataColumn(label: Text("Email")),
                            DataColumn2(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Action")),
                              size: ColumnSize.L,
                            ),
                          ],
                          rows: List.generate(
                            _staffs.length,
                            (index) => DataRow2(
                              cells: [
                                DataCell(
                                    Text(formatValue(_staffs[index]['name']))),
                                DataCell(
                                  Text(formatValue(_staffs[index]['age'])),
                                ),
                                DataCell(
                                    Text(formatValue(_staffs[index]['type']))),
                                DataCell(
                                    Text(formatValue(_staffs[index]['phone']))),
                                DataCell(
                                    Text(formatValue(_staffs[index]['email']))),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  BlocProvider.value(
                                                value: _staffsBloc,
                                                child: AddStaff(
                                                  staffDetails: _staffs[index],
                                                ),
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  CustomAlertDialog(
                                                title: 'Delete Staff?',
                                                description:
                                                    'Deletion will fail if there are records under this staff',
                                                primaryButton: 'Delete',
                                                onPrimaryPressed: () {
                                                  _staffsBloc.add(
                                                    DeleteStaffEvent(
                                                      staffId: _staffs[index]
                                                          ['id'],
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                secondaryButton: 'Cancel',
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.delete)),
                                      TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    StaffDetailsDialog(
                                                      staff: _staffs[index],
                                                    ));
                                          },
                                          child: Text("View Details"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StaffDetailsDialog extends StatelessWidget {
  final Map staff;
  const StaffDetailsDialog({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Staff Details',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (staff['photo'] != null)
            Center(
              child: Image.network(
                staff['photo'],
                height: 100,
                width: 100,
              ),
            ),
          Text('Name: ${formatValue(staff['name'])}'),
          Text('Age: ${formatValue(staff['age'])}'),
          Text('Gender: ${formatValue(staff['gender'])}'),
          Text('Type: ${formatValue(staff['type'])}'),
          Text('Phone: ${formatValue(staff['phone'])}'),
          Text('Email: ${formatValue(staff['email'])}'),
          Text('Salary: ${formatValue(staff['salary'])}'),
        ],
      ),
      primaryButton: 'Close',
      onPrimaryPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
