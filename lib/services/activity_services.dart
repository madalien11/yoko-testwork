import 'package:dio/dio.dart';
import 'package:yoko_testwork/common/dio/my_dio.dart';
import 'package:yoko_testwork/models/activity/activity_model.dart';

abstract class ActivityServices {
  Future<List<ActivityModel>?> getActivities();
}

class ActivityImplServices implements ActivityServices {
  ActivityImplServices({required MyDio myDio}) {
    myDio.path = 'ticket-service/';
    dio = myDio.dio;
  }
  late Dio dio;

  @override
  Future<List<ActivityModel>?> getActivities() async {
    try {
      var response = await dio.get(
        'ticket-types/by-category-code/ACTIVITIES',
      );
      if (response.data != null) {
        var responseList = response.data! as List?;
        if (responseList != null) {
          var result =
              responseList.map((e) => ActivityModel.fromJson(e)).toList();
          return result;
        } else {
          return null;
        }
      }
    } on DioError catch (e) {
      // Handle error
      print(e.response!.data['message'].toString());
      return null;
    }
  }
}
