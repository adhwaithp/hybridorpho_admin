import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybridorpho_admin/common_widget/custom_button.dart';
import 'package:hybridorpho_admin/common_widget/custom_search.dart';
import '../../common_widget/custom_alert_dialog.dart';
import '../../theme/app_theme.dart';
import 'residents_bloc/residents_bloc.dart';
import 'add_edit_resident.dart';

class Residents extends StatefulWidget {
  const Residents({super.key});

  @override
  State<Residents> createState() => _ResidentsState();
}

class _ResidentsState extends State<Residents> {
  final ResidentsBloc _residentsBloc = ResidentsBloc();

  Map<String, dynamic> params = {
    'query': null,
  };

  List<Map> _residents = [];

  @override
  void initState() {
    getResidents();
    super.initState();
  }

  void getResidents() {
    _residentsBloc.add(GetAllResidentsEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _residentsBloc,
      child: BlocConsumer<ResidentsBloc, ResidentsState>(
        listener: (context, state) {
          if (state is ResidentsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getResidents();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is ResidentsGetSuccessState) {
            _residents = state.residents;
            setState(() {});
          } else if (state is ResidentsSuccessState) {
            getResidents();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Residents",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: CustomSearch(
                        onSearch: (search) {
                          params['query'] = search;
                          getResidents();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      inverse: true,
                      iconData: Icons.add,
                      label: 'Add Resident',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                                  value: _residentsBloc,
                                  child: AddEditResident(),
                                ));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (state is ResidentsLoadingState) LinearProgressIndicator(),
              if (state is ResidentsGetSuccessState && _residents.isEmpty)
                Center(
                  child: Text("No Residents found!"),
                ),
              if (state is ResidentsGetSuccessState && _residents.isNotEmpty)
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid, color: outlineColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DataTable2(
                      columns: [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Age")),
                        DataColumn(label: Text("Blood Group")),
                        DataColumn(label: Text("Medical Condition")),
                        DataColumn(
                            label: Align(
                                alignment: Alignment.centerRight,
                                child: Text("Action"))),
                      ],
                      rows: List.generate(
                        _residents.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(
                              Column(
                                children: [
                                  Text(
                                    _residents[index]['name'],
                                  ),
                                  Text(
                                    "ID:${_residents[index]['id']}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            DataCell(Text(_residents[index]['age'].toString())),
                            DataCell(Text(_residents[index]['blood_group'])),
                            DataCell(
                                Text(_residents[index]['medical_condition'])),
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
                                          value: _residentsBloc,
                                          child: AddEditResident(
                                            residentDetails: _residents[index],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomAlertDialog(
                                          title: 'Delete Resident?',
                                          description:
                                              'Deletion will fail if there are records under this resident',
                                          primaryButton: 'Delete',
                                          onPrimaryPressed: () {
                                            _residentsBloc.add(
                                              DeleteResidentEvent(
                                                residentId: _residents[index]
                                                    ['id'],
                                              ),
                                            );
                                            Navigator.pop(context);
                                          },
                                          secondaryButton: 'Cancel',
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ResidentsDetailDialog(
                                                residents: _residents[index]),
                                      );
                                    },
                                    child: Text('View Details'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class ResidentsDetailDialog extends StatelessWidget {
  const ResidentsDetailDialog({
    super.key,
    required this.residents,
  });

  final Map residents;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Resident Details',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (residents['photo'] != null) Image.network(residents['photo']),
          Text('Name: ${residents['name']}'),
          Text('Age: ${residents['age']}'),
          Text('Blood Group: ${residents['blood_group']}'),
          Text('Medical Condition: ${residents['medical_condition']}'),
          // Add more details if needed
        ],
      ),
      primaryButton: 'Close',
      onPrimaryPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
