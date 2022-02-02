import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:store/app/constant.dart';
import 'package:store/data/responses/resposes.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl})=_AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse>login(
      @Field("email")String email,
      @Field("password")String password,
      @Field("imei")String imei,
      @Field("device_type")String device_type,
      );

}