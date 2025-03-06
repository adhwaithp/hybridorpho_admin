part of 'residents_bloc.dart';

@immutable
sealed class ResidentsEvent {}

final class GetAllResidentsEvent extends ResidentsEvent {
  final Map<String, dynamic> params;

  GetAllResidentsEvent({required this.params});
}

final class AddResidentEvent extends ResidentsEvent {
  final Map<String, dynamic> residentDetails;

  AddResidentEvent({required this.residentDetails});
}

final class EditResidentEvent extends ResidentsEvent {
  final int residentId;
  final Map<String, dynamic> residentDetails;

  EditResidentEvent({required this.residentId, required this.residentDetails});
}

final class DeleteResidentEvent extends ResidentsEvent {
  final int residentId;

  DeleteResidentEvent({required this.residentId});
}
