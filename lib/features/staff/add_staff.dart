import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybridorpho_admin/common_widget/custom_alert_dialog.dart';
import 'package:hybridorpho_admin/common_widget/custom_dropdownmenu.dart';
import 'package:hybridorpho_admin/common_widget/custom_image_picker_button.dart';
import 'package:hybridorpho_admin/common_widget/custom_text_formfield.dart';
import 'package:hybridorpho_admin/util/value_validator.dart';

import 'staff_bloc/staffs_bloc.dart';

class AddStaff extends StatefulWidget {
  final Map? staffDetails;
  const AddStaff({super.key, this.staffDetails});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'Male';
  String _staffType = "Cook";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PlatformFile? coverImage;

  @override
  void initState() {
    if (widget.staffDetails != null) {
      _nameController.text = widget.staffDetails!['name'];
      _ageController.text = widget.staffDetails!['age'].toString();
      _phoneController.text = widget.staffDetails!['phone'];
      _salaryController.text = widget.staffDetails!['salary'].toString();
      _gender = widget.staffDetails!['gender'];
      _staffType = widget.staffDetails!['type'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaffsBloc, StaffsState>(
      listener: (context, state) {
        if (state is StaffsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomAlertDialog(
          title: "Add Staff",
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
                    selectedImage: widget.staffDetails?['photo'],
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
                    isLoading: state is StaffsLoadingState,
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
                    isLoading: state is StaffsLoadingState,
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
                    isLoading: state is StaffsLoadingState,
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
                      isLoading: state is StaffsLoadingState,
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
                  Text("Type"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomDropDownMenu(
                      hintText: 'Type',
                      isLoading: state is StaffsLoadingState,
                      initialSelection: _staffType,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          label: "Cook",
                          value: "Cook",
                        ),
                        DropdownMenuEntry(
                          label: "Nurse",
                          value: "Nurse",
                        ),
                      ],
                      onSelected: (val) {
                        _staffType = val!;
                        setState(() {});
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Salary"),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    labelText: 'Salary',
                    controller: _salaryController,
                    validator: numericValidator,
                    isLoading: state is StaffsLoadingState,
                  ),
                  if (widget.staffDetails == null) Text("Email"),
                  if (widget.staffDetails == null)
                    SizedBox(
                      height: 5,
                    ),
                  if (widget.staffDetails == null)
                    CustomTextFormField(
                      isLoading: state is StaffsLoadingState,
                      controller: _emailController,
                      labelText: 'Email',
                      validator: emailValidator,
                    ),
                  if (widget.staffDetails == null) Text("Passsword"),
                  if (widget.staffDetails == null)
                    SizedBox(
                      height: 5,
                    ),
                  if (widget.staffDetails == null)
                    CustomTextFormField(
                      isLoading: state is StaffsLoadingState,
                      controller: _passwordController,
                      labelText: 'Passsword',
                      validator: passwordValidator,
                    ),
                ],
              ),
            ),
          ),
          onPrimaryPressed: () {
            if (_formKey.currentState!.validate() &&
                ((coverImage != null) || widget.staffDetails != null)) {
              Map<String, dynamic> details = {
                'name': _nameController.text.trim(),
                'email': _emailController.text.trim(),
                'password': _passwordController.text.trim(),
                'phone': _phoneController.text.trim(),
                'salary': _salaryController.text.trim(),
                'gender': _gender,
                'type': _staffType,
                'age': _ageController.text.trim(),
              };

              if (coverImage != null) {
                details['image'] = coverImage!.bytes;
                details['image_name'] = coverImage!.name;
              }

              if (widget.staffDetails != null) {
                BlocProvider.of<StaffsBloc>(context).add(
                  EditStaffEvent(
                    staffId: widget.staffDetails!['id'],
                    staffDetails: details,
                  ),
                );
              } else {
                BlocProvider.of<StaffsBloc>(context).add(
                  AddStaffEvent(
                    staffDetails: details,
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
