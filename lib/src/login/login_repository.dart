import 'package:rafay_dairies_and_farms/data/Network/network_api_services.dart';
import 'package:rafay_dairies_and_farms/src/AppUrl/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> LoginApi(var data) async {
    dynamic responce = await _apiServices.postApi(data, AppUrl.LoginApi);
    return responce;
  }
}
