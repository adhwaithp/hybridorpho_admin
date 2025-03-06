import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybridorpho_admin/common_widget/custom_alert_dialog.dart';
import 'package:hybridorpho_admin/common_widget/custom_dropdownmenu.dart';
import 'package:hybridorpho_admin/common_widget/custom_image_picker_button.dart';
import 'package:hybridorpho_admin/common_widget/custom_text_formfield.dart';
import 'package:hybridorpho_admin/util/value_validator.dart';

import 'residents_bloc/residents_bloc.dart';

class AddEditResident extends StatefulWidget {
  final Map? residentDetails;
  const AddEditResident({super.key, this.residentDetails});

  @override
  State<AddEditResident> createState() => _AddEditResidentState();
}

class _AddEditResidentState extends State<AddEditResident> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'Male';
  String _bloodGroup = "A+";
  final TextEditingController _medicalConditionController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PlatformFile? coverImage;

  @override
  void initState() {
    if (widget.residentDetails != null) {
      _nameController.text = widget.residentDetails!['name'];
      _ageController.text = widget.residentDetails!['age'].toString();
      _phoneController.text = widget.residentDetails!['phone'];
      _medicalConditionController.text =
          widget.residentDetails!['medicalCondition'];
      _gender = widget.residentDetails!['gender'];
      _bloodGroup = widget.residentDetails!['bloodGroup'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResidentsBloc, ResidentsState>(
      listener: (context, state) {
        if (state is ResidentsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomAlertDialog(
          title: "Add/Edit Resident",
          content: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomImagePickerButton(
                    selectedImage: widget.residentDetails?['photo'],
                    onPick: (pick) {
                      coverImage = pick;
                      setState(() {});
                    },
                  ),
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    validator: notEmptyValidator,
                    controller: _nameController,
                    isLoading: state is ResidentsLoadingState,
                    labelText: 'Name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Age"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    labelText: 'Age',
                    controller: _ageController,
                    validator: numericValidator,
                    isLoading: state is ResidentsLoadingState,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Phone"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    validator: phoneNumberValidator,
                    controller: _phoneController,
                    labelText: 'Phone',
                    isLoading: state is ResidentsLoadingState,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Gender"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomDropDownMenu(
                      hintText: 'Gender',
                      isLoading: state is ResidentsLoadingState,
                      initialSelection: _gender,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          label: "Male",
                          value: "Male",
                        ),
                        DropdownMenuEntry(
                          label: "Female",
                          value: "Female",
                        ),
                      ],
                      onSelected: (val) {
                        _gender = val!;
                        setState(() {});
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Blood Group"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomDropDownMenu(
                      hintText: 'Blood Group',
                      isLoading: state is ResidentsLoadingState,
                      initialSelection: _bloodGroup,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          label: "A+",
                          value: "A+",
                        ),
                        DropdownMenuEntry(
                          label: "A-",
                          value: "A-",
                        ),
                        DropdownMenuEntry(
                          label: "B+",
                          value: "B+",
                        ),
                        DropdownMenuEntry(
                          label: "B-",
                          value: "B-",
                        ),
                        DropdownMenuEntry(
                          label: "AB+",
                          value: "AB+",
                        ),
                        DropdownMenuEntry(
                          label: "AB-",
                          value: "AB-",
                        ),
                        DropdownMenuEntry(
                          label: "O+",
                          value: "O+",
                        ),
                        DropdownMenuEntry(
                          label: "O-",
                          value: "O-",
                        ),
                      ],
                      onSelected: (val) {
                        _bloodGroup = val!;
                        setState(() {});
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Medical Condition"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    validator: notEmptyValidator,
                    labelText: 'Medical Condition',
                    controller: _medicalConditionController,
                    isLoading: state is ResidentsLoadingState,
                  ),
                ],
              ),
            ),
          ),
          onPrimaryPressed: () {
            if (_formKey.currentState!.validate() &&
                ((coverImage != null) || widget.residentDetails != null)) {
              Map<String, dynamic> details = {
                'name': _nameController.text.trim(),
                'phone': _phoneController.text.trim(),
                'medical_condition': _medicalConditionController.text.trim(),
                'gender': _gender,
                'blood_group': _bloodGroup,
                'age': _ageController.text.trim(),
              };

              if (coverImage != null) {
                details['image'] = coverImage!.bytes;
                details['image_name'] = coverImage!.name;
              }

              if (widget.residentDetails != null) {
                BlocProvider.of<ResidentsBloc>(context).add(
                  EditResidentEvent(
                    residentId: widget.residentDetails!['id'],
                    residentDetails: details,
                  ),
                );
              } else {
                BlocProvider.of<ResidentsBloc>(context).add(
                  AddResidentEvent(
                    residentDetails: details,
                  ),
                );
              }
            }
          },
          primaryButton: 'Save Changes',
        );
      },
    );
  }
}
