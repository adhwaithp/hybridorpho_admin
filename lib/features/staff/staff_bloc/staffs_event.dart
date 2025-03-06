part of 'staffs_bloc.dart';

@immutable
sealed class StaffsEvent {}

class GetAllStaffsEvent extends StaffsEvent {
  final Map<String, dynamic> params;

  GetAllStaffsEvent({required this.params});
}

class AddStaffEvent extends StaffsEvent {
  final Map<String, dynamic> staffDetails;

  AddStaffEvent({required this.staffDetails});
}

class EditStaffEvent extends StaffsEvent {
  final Map<String, dynamic> staffDetails;
  final int staffId;

  EditStaffEvent({
    required this.staffDetails,
    required this.staffId,
  });
}

class DeleteStaffEvent extends StaffsEvent {
  final int staffId;

  DeleteStaffEvent({required this.staffId});
}
