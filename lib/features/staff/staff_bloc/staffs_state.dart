part of 'staffs_bloc.dart';

@immutable
sealed class StaffsState {}

final class StaffsInitialState extends StaffsState {}

final class StaffsLoadingState extends StaffsState {}

final class StaffsSuccessState extends StaffsState {}

final class StaffsGetSuccessState extends StaffsState {
  final List<Map<String, dynamic>> staffs;

  StaffsGetSuccessState({required this.staffs});
}

final class StaffsFailureState extends StaffsState {
  final String message;

  StaffsFailureState({this.message = apiErrorMessage});
}
