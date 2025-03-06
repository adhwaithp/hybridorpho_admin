import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hybridorpho_admin/common_widget/custom_alert_dialog.dart';

class AddEditVolunteerDialog extends StatefulWidget {
  final Map<String, String>? volunteerDetail;
  final Function(Map<String, String>)? onSave;

  const AddEditVolunteerDialog({super.key, this.volunteerDetail, this.onSave});

  @override
  State<AddEditVolunteerDialog> createState() => _AddEditVolunteerDialogState();
}

class _AddEditVolunteerDialogState extends State<AddEditVolunteerDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _joinDateController = TextEditingController();

  @override
  void initState() {
    if (widget.volunteerDetail != null) {
      _nameController.text = widget.volunteerDetail!['name']!;
      _ageController.text = widget.volunteerDetail!['age']!;
      _phoneController.text = widget.volunteerDetail!['phone']!;
      _emailController.text = widget.volunteerDetail!['email']!;
      _skillsController.text = widget.volunteerDetail!['skills']!;
      _availabilityController.text = widget.volunteerDetail!['availability']!;
      _joinDateController.text = widget.volunteerDetail!['joinDate']!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title:
          widget.volunteerDetail == null ? 'Add Volunteer' : 'Edit Volunteer',
      content: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _skillsController,
              decoration: InputDecoration(labelText: 'Skills'),
            ),
            TextField(
              controller: _availabilityController,
              decoration: InputDecoration(labelText: 'Availability'),
            ),
            TextField(
              controller: _joinDateController,
              decoration: InputDecoration(labelText: 'Join Date'),
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),
      primaryButton: 'save',
      onPrimaryPressed: () {
        if (widget.onSave != null) {
          widget.onSave!({
            'name': _nameController.text,
            'age': _ageController.text,
            'phone': _phoneController.text,
            'email': _emailController.text,
            'skills': _skillsController.text,
            'availability': _availabilityController.text,
            'joinDate': _joinDateController.text,
          });
        }
      },
    );
  }
}
