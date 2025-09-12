import 'package:provider_tamplete/data/network/baseapiservices.dart';
import 'package:provider_tamplete/data/network/networkapiservices.dart';
import 'package:provider_tamplete/res/components/app_url.dart';

class AuthRepository {
  Baseapiservices apiServices = Networkapiservices();

  Future<dynamic> loginApi(dynamic data, dynamic header) async {
    try {
      dynamic reponse = await apiServices.getPostApiResponse(
        AppUrl.loginUrl,
        data,
        header,
      );
      return reponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> sginUpApi(dynamic data, Map<String, String> header) async {
    try {
      dynamic reponse = await apiServices.getPostApiResponse(
        AppUrl.sginupUrl,
        data,
        header,
      );
      return reponse;
    } catch (e) {
      rethrow;
    }
  }
}
