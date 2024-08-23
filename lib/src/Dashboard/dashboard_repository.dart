import 'package:http/http.dart';
import 'package:rafay_dairies_and_farms/data/Network/network_api_services.dart';
import 'package:rafay_dairies_and_farms/src/AppUrl/app_url.dart';

class DashboardRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> UserListApi(String? token) async {
    dynamic responce = await _apiServices.getApi(AppUrl.DashboardApi, token);
    return responce;
  }
}
