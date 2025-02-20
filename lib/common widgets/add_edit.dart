import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEditVolunteerDialog extends StatefulWidget {
  final Map<String, dynamic>? volunteerDetail;
  const AddEditVolunteerDialog({
    super.key,
    this.volunteerDetail,
  });

  @override
  State<AddEditVolunteerDialog> createState() => _AddEditVolunteerDialogState();
}

class _AddEditVolunteerDialogState extends State<AddEditVolunteerDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'Male';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.volunteerDetail != null) {
      _nameController.text = widget.volunteerDetail!['name'];
      _ageController.text = widget.volunteerDetail!['age'];
      _phoneController.text = widget.volunteerDetail!['phone'];
      _emailController.text = widget.volunteerDetail!['email'];
      _availabilityController.text = widget.volunteerDetail!['availability'];
      _skillController.text = widget.volunteerDetail!['skill'];
      _ageController.text = widget.volunteerDetail!['age'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Edit volunteers",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'null';
                    } else if (value.trim().isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Age"),
                TextFormField(
                  controller: _ageController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(
                        "[0-9]",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Phone"),
                TextFormField(
                  controller: _phoneController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(
                        "[0-9]",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Gender"),
                DropdownButton(
                    isExpanded: true,
                    value: _gender,
                    items: [
                      DropdownMenuItem(
                        child: Text("Male"),
                        value: "Male",
                      ),
                      DropdownMenuItem(
                        child: Text("female"),
                        value: "Female",
                      ),
                    ],
                    onChanged: (val) {
                      _gender = val!;
                      setState(() {});
                    }),
                SizedBox(
                  height: 10,
                ),
                Text("Email"),
                TextFormField(
                  controller: _emailController,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("availability"),
                TextFormField(
                  controller: _availabilityController,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("skills"),
                TextField(
                  controller: _skillController,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Save changes",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
