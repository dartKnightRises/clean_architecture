import 'package:clean_architecture/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../responses/responses.dart';
part 'app_api.g.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")

  Future<AuthenticationResponse> login(
      @Field("username") String username,
      @Field("password") String password,
      @Field("imei") String imei,
      @Field("deviceType") String deviceType,
      );
}