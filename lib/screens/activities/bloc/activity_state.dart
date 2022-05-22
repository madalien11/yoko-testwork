part of 'activity_bloc.dart';

@immutable
abstract class ActivityState {}

class ActivitiesInitial extends ActivityState {}

class ActivitiesLoading extends ActivityState {}

class ActivitiesUnsuccessful extends ActivityState {
  ActivitiesUnsuccessful({required this.errorMessage});
  final String errorMessage;
}

class ActivitiesSuccessful extends ActivityState {
  ActivitiesSuccessful({required this.activities});
  final List<ActivityModel> activities;
}
