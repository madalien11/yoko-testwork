import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yoko_testwork/models/activity/activity_model.dart';
import 'package:yoko_testwork/services/activity_services.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityServices activityServices;

  ActivityBloc({required this.activityServices}) : super(ActivitiesInitial()) {
    on<ActivityEvent>((event, emit) async {
      if (event is GetActivities) {
        emit(ActivitiesLoading());
        var res = await activityServices.getActivities();
        if (res != null && res.isNotEmpty) {
          emit(ActivitiesSuccessful(activities: res));
        } else {
          emit(ActivitiesUnsuccessful(
            errorMessage: 'No activities were found',
          ));
        }
      }
    });
  }
}
