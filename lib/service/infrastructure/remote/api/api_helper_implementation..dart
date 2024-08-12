import 'package:dio/dio.dart';
import 'package:workout_fitness_app/service/core/data/constants/api_constants/end_points.dart';
import 'package:workout_fitness_app/service/core/data/constants/api_constants/time_outs_seconds.dart';
import 'dart:developer' as dev;

import 'api_helper.dart';

class ApiHelperImplementation extends ApiHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: TimeOuts.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOuts.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOuts.sendTimeout),
    ),
  );

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    dynamic options,
    String? token,
    CancelToken? cancelToken,
    bool isMultipart = false,
  }) async {
     _debugPrintData(endPoint, data, query);
    return await requestData(
      call: () async => await dio.get(
        endPoint,
      ),
    );
  }
  _debugPrintData(String endPoint, data, query) {
    dev.log('URL => ${dio.options.baseUrl + endPoint}');
    dev.log('Body => $data');
  }
}