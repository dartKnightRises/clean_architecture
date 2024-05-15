
import 'package:clean_architecture/app/app_preferences.dart';
import 'package:clean_architecture/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {

  AppPreferences appPreferences;
  DioFactory(this.appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeOut = const Duration(minutes: 1); // 1 min
    String language = await appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers);

    if(kReleaseMode){
      print("Release mode so no logs will be shown");
    }else{
      dio.interceptors.add(PrettyDioLogger(requestHeader: true,requestBody: true,responseHeader: true));
    }

    return dio;
  }
}