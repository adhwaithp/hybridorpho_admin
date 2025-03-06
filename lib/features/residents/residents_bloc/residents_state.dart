part of 'residents_bloc.dart';

@immutable
sealed class ResidentsState {}

final class ResidentsInitial extends ResidentsState {}

final class ResidentsLoadingState extends ResidentsState {}

final class ResidentsGetSuccessState extends ResidentsState {
  final List<Map<String, dynamic>> residents;

  ResidentsGetSuccessState({required this.residents});
}

final class ResidentsSuccessState extends ResidentsState {}

final class ResidentsFailureState extends ResidentsState {
  final String message;

  ResidentsFailureState({this.message = apiErrorMessage});
}
